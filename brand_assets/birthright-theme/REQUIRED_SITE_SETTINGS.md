# Required site settings

The Birthright theme assumes these are set before activation. `scripts/setup.rb` sets them for you, but if you install the theme manually, set them in Admin → Settings:

| Setting | Required value | Why |
|---|---|---|
| `desktop_category_page_style` | **`subcategories_with_featured_topics`** | Renders parents as section labels and children as category cards — the foundation of the design's left column. The TOP topics rail is layered in via a Glimmer connector, see below. |
| `navigation_menu` | `header dropdown` | We restyle the header nav; the sidebar is hidden. |
| `enable_sidebar` | `false` | Sidebar layouts misalign the gradient bleed. |
| `top_menu` | `categories\|latest\|top\|unread\|new` | Categories first. |
| `category_style` | `box` | Crests + cards expect the box layout. |
| `enable_glimmer_topic_list` | `true` | The CSS targets the modern topic-list. |
| `tagging_enabled` | `true` | The `br-official` tag drives the "BR" badge. |
| `default_dark_mode_color_scheme_id` | id of the "Birthright Crimson" scheme bundled with the theme | — |

> **Important — do NOT use `categories_and_top_topics`.** That style hides subcategory cards under each parent, which breaks the design. We get the TOP rail back via the connector `connectors/discovery-categories-above/birthright-top-rail.gjs`, which renders a right-side rail of top topics next to the cats stack.

After changing these, do a hard refresh (Cmd-Shift-R) — some are bundled into the boot payload and don't hot-reload.

---

## Why this combination

Discourse has no native page style that renders **all three** of:

1. parents as small uppercase section labels (not clickable cards),
2. children as cards under each parent,
3. a TOP topics rail to the right of the whole stack.

The closest native option is `subcategories_with_featured_topics`, which gives us (1) and (2) for free. (3) is implemented as a theme-side Glimmer component that fetches top topics and renders the rail in a 2-column grid via SCSS (`.discovery.categories > .container { display: grid; grid-template-columns: 1.4fr 1fr; gap: 56px; }`).

The other two paths considered:

- **`categories_and_top_topics` + JS-injected subcategories** — fights the framework on every render; subcategory cards flash in late.
- **Full `discovery.categories` route override** — cleanest end state but largest investment; revisit if the connector approach hits friction.

---

## Hero image — how `hero_image_url` is meant to be set

`hero_image_url` is read from the theme-settings store, which is hydrated at boot from the `theme_settings` table. **Set it through the admin UI, not by writing the DB directly:**

> Admin → Customize → Themes → **Birthright** → Settings → `hero_image_url`

That path goes through `Theme#update_setting`, which invalidates the client cache and re-broadcasts the new value to all open clients via MessageBus. A hard reload picks it up immediately.

**Do not** `INSERT`/`UPDATE` directly into the `theme_settings` table — the cache will not invalidate and the connector will keep serving the stale value (or throw `Discourse::NotFound` on the next theme rebuild, as observed on 2026.5).

If you must set it programmatically (e.g. from `scripts/setup.rb`), use the Rails-runner API:

```ruby
theme = Theme.find_by(name: "Birthright")
theme.update_setting(:hero_image_url, "https://cdn.example.com/birthright-hero.jpg")
theme.save!
# update_setting + save! together trigger the cache invalidation + MessageBus push.
```

The hero connector reads `settings.hero_image_url` from `discourse/lib/theme-settings-store`, which is the live, MessageBus-fed copy — no extra wiring needed in the component.
