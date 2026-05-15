# scripts/setup-no-restructure.rb
# ----------------------------------------------------------------------------
# Birthright Discourse theme installer — LOCAL DOCKER VARIANT.
#
# Same as setup.rb but with sections 4 (category restructure) and 5 (category
# color CSV write-back) commented out. Owner wants existing local categories
# preserved (Announcements, The Royal Library, BRCS 5th, BRO MMO, BRCS 4th,
# BRCS 3.0/3.5, MPGN, BRWiki Discussions, Birthright.net support).
#
# Run inside the Discourse container:
#
#   cd /var/www/discourse
#   BR_THEME_PATH=/shared/birthright-theme \
#     RAILS_ENV=production bundle exec rails runner \
#     /shared/birthright-theme/scripts/setup-no-restructure.rb
# ----------------------------------------------------------------------------

require "yaml"

THEME_PATH = ENV["BR_THEME_PATH"] || "/shared/birthright-theme"
THEME_NAME = "Birthright"
SPEC_FILE  = File.join(THEME_PATH, "scripts", "categories.yml")

abort "Cannot find theme at #{THEME_PATH}" unless THEME_PATH.start_with?("http") || File.directory?(THEME_PATH)

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
  begin
    current = SiteSetting.get(key)
  rescue Discourse::InvalidParameters
    puts "    #{key}: skipped (setting not present in this Discourse version)"
    next
  end
  next if current.to_s == val.to_s
  begin
    SiteSetting.set(key, val)
    puts "    #{key} = #{val} (was #{current.inspect})"
  rescue => e
    puts "    #{key}: skipped (#{e.class}: #{e.message})"
  end
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
  if existing
    theme = RemoteTheme.import_theme_from_directory(THEME_PATH, theme_id: existing.id)
    theme.update!(name: THEME_NAME) unless theme.name == THEME_NAME
    puts "    Updated #{THEME_NAME} from local #{THEME_PATH}"
  else
    theme = RemoteTheme.import_theme_from_directory(THEME_PATH)
    theme.update!(name: THEME_NAME) unless theme.name == THEME_NAME
    puts "    Created #{THEME_NAME} from local #{THEME_PATH}"
  end
end

theme.set_default!
puts "    Theme set as site default (id=#{theme.id})"

# 3. Apply Birthright Crimson color scheme as default dark scheme -------------

scheme = ColorScheme.find_by(name: "Birthright Crimson")
if scheme
  begin
    SiteSetting.set(:default_dark_mode_color_scheme_id, scheme.id)
    puts "==> default_dark_mode_color_scheme_id = #{scheme.id} (Birthright Crimson)"
  rescue Discourse::InvalidParameters => e
    puts "==> default_dark_mode_color_scheme_id setting not present in this Discourse — applying scheme to theme directly"
  end
  # Apply scheme to the theme itself so it always renders
  if theme.color_scheme_id != scheme.id
    theme.color_scheme_id = scheme.id
    theme.save!
    puts "==> Theme color_scheme_id = #{scheme.id} (Birthright Crimson)"
  end
else
  puts "==> Birthright Crimson scheme not found; theme may not have created it yet"
end

# 4. Restructure categories --- DISABLED for local docker deploy --------------
# Owner wants existing categories preserved. Re-enable by running setup.rb
# (the standard variant) when ready to run the full categories.yml plan.
puts "==> Skipping category restructure (local-docker variant)"

# 5. Write the category-color CSV back into theme settings --- DISABLED -------
# Bound to the categories.yml plan; skipped here so it doesn't lock category
# colors to slugs that don't exist on the local install.
puts "==> Skipping category_color_map write-back (local-docker variant)"

# Force JS cache clear and stylesheet recompile (defensive for re-deploys) ----
begin
  theme.javascript_cache.destroy_all
  puts "==> Cleared theme javascript_cache"
rescue => e
  puts "    (javascript_cache clear skipped: #{e.message})"
end

theme.save! # triggers stylesheet recompile
puts "==> Theme re-saved (stylesheet recompile triggered)"

puts "==> Done. Reload your browser (Cmd-Shift-R) to see the new theme."
