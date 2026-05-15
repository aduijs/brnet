# Birthright Discourse Theme — Setup & Operations Guide

This is a **complete Discourse theme** (not a component) targeting Discourse
2026.5+ with the Glimmer renderer. It implements the Birthright.net forum
redesign delivered earlier as an HTML prototype, ported to real Discourse
conventions: Glimmer connectors, SCSS theme tokens, plugin-outlet injection,
and `apiInitializer` for runtime DOM tweaks.

## Repository layout

```
birthright-theme/
├── about.json
├── settings.yml
├── common/
│   ├── common.scss          # all shared CSS, with PROTOTYPE → DISCOURSE class map
│   ├── head_tag.html        # Inter + Cinzel font preload
│   └── body_tag.html        # reserved
├── desktop/desktop.scss     # ≥1024px overrides
├── mobile/mobile.scss       # <1024px overrides
├── javascripts/discourse/
│   ├── initializers/
│   │   └── birthright-init.js
│   ├── connectors/
│   │   ├── above-site-header/birthright-userbar.gjs
│   │   ├── below-site-header/birthright-hero.gjs
│   │   └── category-box-before/birthright-category-crest.gjs
│   └── components/
│       └── birthright-crest.gjs
├── assets/                  # drop hero artwork PNGs/SVGs here
├── scripts/
│   ├── setup.rb             # Rails-runner: install theme + categories
│   └── categories.yml       # category restructure spec
├── REQUIRED_SITE_SETTINGS.md
└── README.md (this file)
```

## Required site settings

The theme assumes these site settings are set BEFORE installation. Either set
them in Admin → Settings, or run `scripts/setup.rb` which sets them for you.

| Setting | Value | Why |
|---|---|---|
| `desktop_category_page_style` | **`subcategories_with_featured_topics`** | Renders parents-as-section-labels + children-as-cards. The TOP topics rail is layered in via the connector `discovery-categories-above/birthright-top-rail.gjs` (Pad A). Do **not** use `categories_and_top_topics` — it hides subcategory cards. See REQUIRED_SITE_SETTINGS.md. |
| `navigation_menu` | `header dropdown` | We restyle the header nav; the sidebar is hidden. |
| `top_menu` | `categories\|latest\|top\|unread\|new` | Categories first. |
| `category_style` | `box` | Crests + cards use the box layout. |
| `enable_glimmer_topic_list` | `true` | The CSS targets the modern topic-list. |
| `default_dark_mode_color_scheme_id` | `<id of "Birthright Crimson">` | Theme ships its own color scheme. |
| `enable_sidebar` | `false` | We hide the sidebar; the header dropdown is the nav. |
| `tagging_enabled` | `true` | The `br-official` tag drives the "BR" badge. |

A copy of this is also in `REQUIRED_SITE_SETTINGS.md` for the operator.

## Installation

### Option A — git import (preferred, integrates with theme updates)

```bash
cd /var/discourse
./launcher enter app
# inside the container:
cd /var/www/discourse
RAILS_ENV=production bundle exec rake themes:install -- \
  '{"birthright": "https://github.com/your-org/discourse-theme-birthright.git"}'
```

If you're updating an existing theme (id=1):

```bash
RAILS_ENV=production bundle exec rails runner '
  t = Theme.find(1)
  t.remote_theme.update_from_remote
  t.save!
  puts "Updated theme: #{t.name}"
'
```

### Option B — Rails-runner installer

The `scripts/setup.rb` file does everything in one shot: imports the theme,
sets required site settings, restructures the category tree from
`categories.yml`, and writes the category-color CSV into the theme's settings.

```bash
cd /var/discourse
./launcher enter app
cd /var/www/discourse
# Place this theme repo at /shared/birthright-theme inside the container,
# or set BR_THEME_PATH to an HTTPS git URL.
BR_THEME_PATH=/shared/birthright-theme \
  RAILS_ENV=production bundle exec rails runner /shared/birthright-theme/scripts/setup.rb
```

Run it again any time after updating files — it's idempotent.

### Option C — Admin UI

Admin → Customize → Themes → Install → "From a git repository" → paste your repo URL.

## Prototype → Discourse class mapping (high level)

The detailed map is in the comments at the top of `common/common.scss`. Highlights:

| Prototype | Discourse |
|---|---|
| `.userbar` | Connector `above-site-header/birthright-userbar.gjs` (renders `.birthright-userbar`) |
| `.hero` | Connector `below-site-header/birthright-hero.gjs` (renders `.birthright-hero`) |
| `.cat-card` | `.category-list-item`, `.category-box`, `.category-box-inner` (all targeted) |
| `.cat-icon` (Crest) | Connector `category-box-before/birthright-category-crest.gjs` (renders `.birthright-crest`) |
| `.tabs` | `.nav-pills > li > a` |
| `.topic-row` (rail) | `.latest-topic-list .latest-topic-list-item` |
| `.topic-table` | `.topic-list` (`<table>`), rows `.topic-list-item` |
| `.tt-blizz` ("BR" badge) | `.topic-list-item.br-flagged` (added by initializer for `br-official`-tagged or globally pinned topics) |
| `.post` | `article.boxed.regular`, `.topic-post` |
| `.post-meta` | `.topic-meta-data` (no-wrap, all children `white-space: nowrap`) |
| `.thread-timeline` | `.timeline-container .topic-timeline` |
| `.composer` | `#reply-control` |
| `.profile-banner` | `.user-main .user-profile-image` |

We **target Discourse classes directly** in `common.scss` — there are no `.cat-card` selectors anymore. The prototype class names exist only as comments for traceability.

## Glimmer connectors — how they work

The `connectors/<outlet-name>/<file>.gjs` convention is the modern equivalent of the legacy `<script type="text/x-handlebars">` blocks. Each `.gjs` file exports a Glimmer component that Discourse mounts at the named plugin outlet.

The three connectors we ship:

1. **`above-site-header/birthright-userbar.gjs`** — adds the brand mark and name inside the `.d-header`. Mounting in `above-site-header` keeps it inside the same sticky bar as the rest of the Discourse nav.

2. **`below-site-header/birthright-hero.gjs`** — renders the gradient hero only on the categories route. Reads `hero_image_url`, `hero_title`, `hero_subtitle`, and `show_hero_banner` from theme settings.

3. **`category-box-before/birthright-category-crest.gjs`** — renders the rotated-diamond crest as the category icon. Replaces the stock `.badge-category-bg` (hidden via SCSS).

If your fork needs a custom outlet that doesn't exist, add the outlet name and its parent route to a comment in the connector — do **not** revert to handlebars script tags.

## Theme settings — exposed in Admin → Customize → Themes → Birthright → Settings

These match the prototype's Tweaks panel:

- `accent_color` — crimson / blood / amber / azure / emerald
- `hero_tint` — burgundy / ember / arcane / forest
- `show_hero_banner` — toggle the categories hero
- `hero_image_url`, `hero_title`, `hero_subtitle` — wordmark + image
- `brand_name`, `show_userbar_brand` — userbar control
- `category_color_map` — CSV of `slug:#hex` for crest colors

Settings are applied live via `birthright-init.js`, which writes
`data-br-accent` / `data-br-hero` attributes on `<html>` for the SCSS to react to.

## Category restructure

See `scripts/categories.yml`. The file declares the 9 visible categories
grouped under three parents (Community / Gameplay & Lore / Site), the color
per category, and which existing categories to merge or archive.

`scripts/setup.rb` reads it and:

1. Creates parent categories `community`, `gameplay-and-lore`, `site` if missing.
2. Moves listed children under the right parent.
3. Sets each category's color to the spec'd hex.
4. Archives every category not in the spec (sets `read_restricted = true`, `description = "[archived]"`, removes from default top menu).
5. Writes the resulting `slug:#hex` CSV back to `category_color_map`.

It's idempotent — safe to re-run.

## What's NOT covered (future work)

These are explicitly out of scope for this theme; do them as a plugin or accept the upstream behavior:

- **Login/signup as a routed page.** Discourse renders auth as a modal. Replacing it with a full-page route requires a plugin (`plugin.rb` + a custom route + a `route-map.js.es6`). The theme **styles** the existing modal to match the design — that's as far as a theme can go.
- **Custom topic-thread layout JSX.** The HTML prototype's left-rail/right-rail/composer triptych is approximated by Discourse's existing `topic-area` / `timeline-container`. Pixel-perfect parity would require overriding `discourse/components/topic-list` and `topic-post`, which a theme can do via `api.modifyClass` only at the level of behavior, not template structure. The current SCSS gets ~95% there.
- **OAuth row** on login (Discord/Google/GitHub) — these come from auth plugins (`discourse-oauth2-basic`, `omniauth-google-oauth2`, etc.). Install and configure those separately; this theme will style their buttons.
- **Profile badges grid** — Discourse renders badges; we restyle. The prototype's medal gradients and "Codex Keeper" naming are illustrative.
- **Live "BR" badge logic** beyond `br-official`-tagged or globally pinned. Add additional rules in `birthright-init.js` `addTopicListItemClassesCallback`.

## Compatibility

- **Discourse 2026.5.0** and later. Uses `api version "1.39.0"`.
- **Modern Glimmer renderer required.** Set `enable_glimmer_topic_list = true`.
- **`navigation_menu = "header dropdown"`** required — sidebar layouts will misalign the gradient bleed.
- **Mobile tested** at ≥360px width.

## Smoke test after install

1. Sign in as admin.
2. Visit `/categories` — you should see the burgundy gradient, the hero, the two-column layout, crests in place of icons.
3. Click a category — topic-list should be a dark table with pinned rows on top, a "BR" badge on `br-official` tags, and the views column gold for >1000.
4. Click a topic — post body, quote block, replies-toggle, timeline rail, composer all themed.
5. Open `/u/<your-username>/summary` — banner gradient, oversized circular avatar, two-column body.
6. Admin → Customize → Themes → Birthright → Settings — change `accent_color`, reload, confirm crimson → blood.

If any step fails, see `REQUIRED_SITE_SETTINGS.md` first.
