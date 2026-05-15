# scripts/setup.rb
# ----------------------------------------------------------------------------
# Birthright Discourse theme installer + category restructure.
#
# Run inside the Discourse container:
#
#   cd /var/discourse && ./launcher enter app
#   cd /var/www/discourse
#   BR_THEME_PATH=/shared/birthright-theme \
#     RAILS_ENV=production bundle exec rails runner \
#     /shared/birthright-theme/scripts/setup.rb
#
# BR_THEME_PATH may be a local path or an https:// git URL.
# Idempotent — safe to re-run.
# ----------------------------------------------------------------------------

require "yaml"

THEME_PATH = ENV["BR_THEME_PATH"] || "/shared/birthright-theme"
THEME_NAME = "Birthright"
SPEC_FILE  = File.join(THEME_PATH, "scripts", "categories.yml")

abort "Cannot find theme at #{THEME_PATH}" unless THEME_PATH.start_with?("http") || File.directory?(THEME_PATH)
abort "Cannot find #{SPEC_FILE}" unless THEME_PATH.start_with?("http") || File.exist?(SPEC_FILE)

# 1. Required site settings ---------------------------------------------------

puts "==> Setting required site settings"
{
  desktop_category_page_style:        "subcategories_with_featured_topics",
  navigation_menu:                    "header dropdown",
  enable_sidebar:                     false,
  top_menu:                           "categories|latest|top|unread|new",
  category_style:                     "box",
  enable_glimmer_topic_list:          true,
  tagging_enabled:                    true
}.each do |key, val|
  current = SiteSetting.get(key)
  next if current.to_s == val.to_s
  SiteSetting.set(key, val)
  puts "    #{key} = #{val} (was #{current.inspect})"
end

# 2. Install or update the theme ---------------------------------------------

puts "==> Installing/updating theme: #{THEME_NAME}"
existing = Theme.where(name: THEME_NAME).first

if THEME_PATH.start_with?("http")
  if existing&.remote_theme
    existing.remote_theme.update_from_remote
    existing.save!
    theme = existing
    puts "    Updated #{THEME_NAME} from #{THEME_PATH}"
  else
    theme = RemoteTheme.import_theme(THEME_PATH)
    theme.update!(name: THEME_NAME)
    puts "    Imported #{THEME_NAME} from #{THEME_PATH}"
  end
else
  importer = ThemeStore::DirectoryImporter.new(THEME_PATH)
  if existing
    theme = existing
    theme.update_from_local_path(THEME_PATH) if theme.respond_to?(:update_from_local_path)
    puts "    Updated #{THEME_NAME} from local #{THEME_PATH}"
  else
    theme = Theme.create!(name: THEME_NAME, user_id: Discourse::SYSTEM_USER_ID)
    importer.import_theme(theme)
    puts "    Created #{THEME_NAME} from local #{THEME_PATH}"
  end
end

theme.set_default!
puts "    Theme set as site default (id=#{theme.id})"

# 3. Apply Birthright Crimson color scheme as default dark scheme -------------

scheme = ColorScheme.find_by(name: "Birthright Crimson")
if scheme
  SiteSetting.set(:default_dark_mode_color_scheme_id, scheme.id)
  puts "==> default_dark_mode_color_scheme_id = #{scheme.id} (Birthright Crimson)"
else
  puts "==> Birthright Crimson scheme not found; theme may not have created it yet"
end

# 4. Restructure categories ---------------------------------------------------

if File.exist?(SPEC_FILE)
  spec = YAML.load_file(SPEC_FILE)
  puts "==> Restructuring categories"

  parent_ids = {}
  (spec["parents"] || []).each do |p|
    cat = Category.find_by(slug: p["slug"]) || Category.new(slug: p["slug"])
    cat.assign_attributes(
      name: p["name"],
      color: p["color"],
      text_color: p["text_color"] || "FFFFFF",
      position: p["position"] || 0,
      user_id: Discourse::SYSTEM_USER_ID
    )
    cat.save!
    parent_ids[p["slug"]] = cat.id
    puts "    parent: #{p['slug']} (id=#{cat.id})"
  end

  visible_slugs = []
  (spec["visible"] || []).each do |c|
    cat = Category.find_by(slug: c["slug"]) || Category.new(slug: c["slug"])
    cat.assign_attributes(
      name: c["name"],
      color: c["color"],
      text_color: "FFFFFF",
      description: c["description"],
      parent_category_id: parent_ids[c["parent"]],
      read_restricted: c["read_restricted"] || false,
      user_id: Discourse::SYSTEM_USER_ID
    )
    cat.save!
    visible_slugs << c["slug"]
    puts "    visible: #{c['slug']} (parent=#{c['parent']}, color=##{c['color']})"
  end

  # Merges
  (spec["merge"] || []).each do |m|
    src = Category.find_by(slug: m["from"])
    dst = Category.find_by(slug: m["into"])
    next unless src && dst
    moved = Topic.where(category_id: src.id).update_all(category_id: dst.id)
    src.update!(read_restricted: true, description: "[merged into #{dst.name}]")
    puts "    merge: #{m['from']} → #{m['into']} (moved #{moved} topics)"
  end

  # Archive everything else
  Category.where.not(slug: visible_slugs + parent_ids.keys + (spec["merge"] || []).map { _1["from"] }).each do |c|
    next if c.parent_category_id.nil? && c.subcategories.any? # don't kill orphan parents with active subs
    next if c.id == SiteSetting.uncategorized_category_id
    next if c.description.to_s.start_with?("[archived]")
    c.update!(
      read_restricted: true,
      description: "[archived] #{c.description}".strip
    )
    puts "    archived: #{c.slug}"
  end
end

# 5. Write the category-color CSV back into theme settings --------------------

if File.exist?(SPEC_FILE)
  spec = YAML.load_file(SPEC_FILE)
  csv = (spec["visible"] || []).map { |c| "#{c['slug']}:##{c['color']}" }.join(",")
  theme.update_setting(:category_color_map, csv)
  theme.save!
  puts "==> category_color_map written (#{csv.length} chars)"
end

puts "==> Done. Reload your browser (Cmd-Shift-R) to see the new theme."
