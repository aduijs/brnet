# Birthright.net Redesign — SEO Landscape Research

**Date:** 2026-05-16
**Researcher:** NERGAL
**Brief:** Map the keyword landscape, identify content gaps Birthright.net could own, assess the current technical-SEO baseline, recommend schema.org markup and internal-linking strategy. No paid keyword tools — public SERP + WebFetch only.

---

## 1. Keyword Clusters

> **Method:** WebSearch on each cluster, then assess (a) SERP density and competition, (b) top 3 ranking results, (c) birthright.net's current visibility, (d) whether birthright.net could own a content gap with the right page.
>
> **Volume bands (qualitative):** Low (<1K/mo est.), Medium (1–10K/mo), High (10K+/mo). Bands inferred from SERP density, presence of featured snippets/PAA boxes, breadth of ranking sites.

### Cluster 1 — Brand & Core IP Queries

**Sample queries:** `birthright campaign setting`, `birthright AD&D`, `cerilia`, `birthright wiki`, `birthright D&D`

| Signal | Reading |
|--------|---------|
| Volume | Low–Medium (niche TTRPG but stable evergreen) |
| Competition | Low — small fan-site cluster, no commercial sites bidding |
| Top 3 results | (1) Wikipedia *Birthright (campaign setting)* — encyclopaedic. (2) birthright.net homepage. (3) Fandom (dungeonsdragons.fandom.com or wikiproject-dungeons-dragons.fandom.com) — derivative pages. |
| Birthright.net visibility | **Already #1 or #2 on every brand query.** Strong. |
| Content gap | None — but Wikipedia outranks Birthright.net on the most-searched brand term. A canonical "What is Birthright?" landing page on birthright.net with proper schema could overtake it. |

### Cluster 2 — Setting-Specific Lore (high-intent niche)

**Sample queries:** `cerilia map`, `anuire`, `awnshegh`, `mhoried`, `tuornen`, `diemed`, `bloodline derivation`, `book of regency`

| Signal | Reading |
|--------|---------|
| Volume | Low individually, but the **long tail aggregates to Medium** — hundreds of realm/character/concept queries |
| Competition | Very low — only birthright.net's own legacy wiki pages and Fandom mirrors rank |
| Top 3 results (typical) | (1) `birthright.net/forums/showwiki.php?title=X` (legacy showwiki URL). (2) Fandom mirror. (3) Wikipedia or 1d6chan/Miraheze derivative. |
| Birthright.net visibility | **Owns most queries** — but via the **old `showwiki.php?title=...` URL pattern**, which is the largest single SEO problem on the site (see §3, baseline). |
| Content gap | **Massive** — every realm has Player's Secrets supplement material that no clean, fast, modern page covers. Today's audit caught Sam dropping at Tuornen because the page reads as a wiki dump. A redesigned realm page = atmospheric photography + 3-sentence summary + structured data + tool action → can outrank Fandom for every realm name. |

### Cluster 3 — Domain & Rules Mechanics

**Sample queries:** `domain turn rules`, `regency points D&D`, `source holdings`, `law holdings`, `guild holdings`, `temple holdings`, `domain action`

| Signal | Reading |
|--------|---------|
| Volume | Low absolute / Medium intent — searchers are GMs trying to find rules text |
| Competition | Medium — competes with GMBinder (Marsupialmancer 5E conversion), Tribality articles, Reddit threads, Brandes Stoddard's blog |
| Top 3 results (typical) | (1) `birthright.net/forums/showwiki.php?title=BRCS:Chapter_five...`. (2) gmbinder.com (Marsupialmancer 5E conversion). (3) Tribality or Reddit. |
| Birthright.net visibility | **Ranks but with terrible URLs and slow forum-showwiki pages.** Marsupialmancer's GMBinder page is winning the 5E-conversion query traffic. |
| Content gap | **Yes** — a dedicated `/rules/domain-turn/` page with proper headings, schema, and links to a domain-turn calculator tool would consolidate this entire cluster under one Birthright.net URL. Currently the BRCS chapters are scattered across `showwiki.php?title=BRCS:Chapter_X...` and no single canonical hub exists. |

### Cluster 4 — Audience-Overlap (highest growth potential)

**Sample queries:** `kingdom management D&D 5e`, `domain rulership 5e`, `political intrigue TTRPG`, `low magic D&D setting`, `forgotten realms alternatives`

| Signal | Reading |
|--------|---------|
| Volume | **Medium–High** — `kingdom management 5e` and `domain rulership 5e` have active forum discussion, multiple supplements (Matt Colville's *Kingdoms & Warfare*, Pathfinder *Kingmaker*, Magpie *Kingdom* RPG, Reign), and SERP density |
| Competition | Medium — Matt Colville's MCDM, Kobold Press, Magpie, individual DM blogs (Lex Starwalker, Brandes Stoddard). None of them are *Birthright*. |
| Top 3 results | Wargamer.com (Matt Colville article), D&D Beyond forums (homebrew kingdom supplement threads), Ultimate Rulership (Legendary Games on Amazon). |
| Birthright.net visibility | **Effectively zero on these queries.** This is the biggest unfair invisibility in the dataset. |
| Content gap | **Five-star opportunity.** Birthright is the **original D&D domain-management setting (1995)**. Every modern kingdom-management supplement is derivative. A page positioned as *"Domain Rulership in D&D — the original mechanics, 1995–present"* with a clean comparison to Matt Colville's K&W, Pathfinder *Kingmaker*, *Reign*, *Kingdom* RPG could capture this entire cluster. This is **the biggest single SEO/positioning win available.** |

### Cluster 5 — Nostalgia / Dormant-TTRPG

**Sample queries:** `AD&D 2e settings`, `TSR campaign settings`, `forgotten D&D settings`, `dormant TTRPG settings`, `Birthright revival`

| Signal | Reading |
|--------|---------|
| Volume | Low–Medium — strong evergreen interest, OSR revival has been ongoing for a decade |
| Competition | Low — TheGamer / Nerdarchy / Wargamer listicles, Wikipedia *Dungeons & Dragons campaign settings* |
| Top 3 results | Wikipedia campaign settings, "10 Forgotten D&D Settings That Need To Come Back" (TheGamer), Wargamer.com 2025 settings article |
| Birthright.net visibility | Wikipedia external-link only; rarely ranked organically |
| Content gap | **Yes** — a "Birthright: 29 Years of Continuous Fan Stewardship" page (history + fan project timeline + DriveThruRPG Platinum status from 2023 + community size + 5E conversion projects) gives Birthright.net entry into every "dormant settings revival" listicle. **Also primes journalists/podcasters** for outreach. |

### Cluster 6 — Tooling & Utility

**Sample queries:** `domain turn calculator`, `bloodline generator`, `cerilia map`, `province map birthright`, `regency calculator`

| Signal | Reading |
|--------|---------|
| Volume | Low but **highest intent of any cluster** — searcher already plays Birthright |
| Competition | Negligible — `gm.mapgears.com/birthright-map/` exists as a community map; `adube/birthright-map` on GitHub; cartographersguild thread. No tools rank. |
| Top 3 results | mapgears, GitHub repo, Cartographersguild thread |
| Birthright.net visibility | None — no tools published on the official site |
| Content gap | **Tool pages are SEO unicorns** — interactive, link-worthy, return visitors. A `/tools/domain-turn-calculator/`, `/tools/bloodline-generator/`, `/tools/cerilia-map/` (clickable, with province data) would all rank #1 immediately for their queries and pull in repeat traffic from active GMs. The mapgears map proves demand; Birthright.net should own it. |

### Cluster 7 — Adjacent Passion (book/MMO audience)

**Sample queries:** `political fantasy RPG`, `low magic D&D`, `game of thrones D&D setting`, `Crusader Kings tabletop`

| Signal | Reading |
|--------|---------|
| Volume | Medium — GoT and Crusader Kings are huge audience anchors |
| Competition | Medium — D&D blogs reference GoT constantly; CK references are rarer in TTRPG SERPs |
| Top 3 results | DM blogs, Reddit threads, RPGnet forums |
| Birthright.net visibility | None |
| Content gap | **Yes** — a "Birthright is the D&D setting for Game of Thrones fans" and "Birthright is Crusader Kings: the Tabletop" comparison content (with appropriate care — these are descriptors not affiliations) lands the high-intent reader who *wants* this kind of play but doesn't know Birthright exists. |

### Cluster 8 — The 1996 PC Game

**Sample queries:** `birthright the gorgons alliance`, `birthright pc game`, `gorgons alliance walkthrough`

| Signal | Reading |
|--------|---------|
| Volume | Low — old game with abandoned-ware status |
| Competition | Low — GameFAQs, ClassicReload, Sierra fan sites |
| Top 3 results | GameFAQs walkthrough, archive.org manual, classicreload.com |
| Birthright.net visibility | None |
| Content gap | Modest — a single `/legacy/gorgons-alliance/` history page would catch this small but persistent traffic and convert PC-game-nostalgia visitors into TTRPG-aware visitors. Worth doing for ~30 min of effort. |

---

## 2. Top 5 Content-Gap Opportunities (one well-built page each)

Ranked by **(intent × winnable competition × audience-overlap with redesign goals)**:

| # | Query target | Page concept | Why it wins |
|---|--------------|--------------|-------------|
| 1 | `kingdom management D&D 5e` / `domain rulership 5e` (Cluster 4) | **"The Original Domain-Management Setting: Birthright vs Kingdoms & Warfare vs Pathfinder Kingmaker vs Reign"** — a long-form comparison anchored on Birthright as the 1995 source. Includes a side-by-side mechanics table, "which one fits which campaign style", and links to the BRCS 5E conversion + Marsupialmancer's GMBinder. | Highest-volume cluster Birthright is invisible on; positioning advantage is unassailable (you *are* the original); Matt Colville's audience is the perfect overlap with Birthright's core appeal. |
| 2 | `cerilia map` (Cluster 6) | **Interactive Cerilia map** — pannable, zoomable, clickable provinces showing realm + ruler + bloodline + region; filterable by allegiance / region / bloodline derivation. Tool, not article. | Mapgears proves the demand. Tool pages are SEO and link-bait gold. Returns visitors. Already on the homepage as a planned feature per the WebFetch above. |
| 3 | `awnshegh` / `awnsheghlien` (Cluster 2) | **"The Awnsheghlien — D&D's Original Dark Lords"** — atmospheric long-form page on the Gorgon, the Spider, the Banshegh, the Sphinx etc, with art and lore links into each. | "Awnshegh" is uniquely Birthright vocabulary — anyone searching it is either a player or a referrer. Currently 1d6chan and TVTropes rank above Birthright.net. Easy to reclaim. |
| 4 | `birthright net` brand + setting + "what is" intent (Cluster 1) | **Canonical "What is Birthright?" page** with proper `Game` + `CreativeWork` schema, internal links to all six axes (World / Rules / Wiki / Tools / Community / Downloads). | Wikipedia outranks Birthright.net for the brand right now. Owning the brand query is table stakes for any other SEO work. |
| 5 | `low magic political fantasy D&D` / `political intrigue TTRPG` (Cluster 7) | **"Why Birthright is the D&D Setting for Game of Thrones and Crusader Kings Fans"** — careful, no-IP-infringement comparison that lands the obvious-but-unsearched audience. | Captures a passion audience that overlaps perfectly with Birthright's actual play feel but has no idea the setting exists. Drives discovery, not loyalty. |

---

## 3. Current SEO Baseline (12-bullet checklist)

Assessed by direct `curl` of `https://www.birthright.net/` plus WebFetch of HTML head and subpage URLs.

| # | Element | Present? | Notes |
|---|---------|----------|-------|
| 1 | `<title>` | ✅ | *"BIRTHRIGHT.NET — Rule a Domain, Shape a World"* — well-written, on-brand |
| 2 | `<meta name="description">` | ✅ | *"The official home of the Birthright campaign setting…"* — solid, ~150 chars, keyword-rich |
| 3 | `<meta name="viewport">` | ✅ | `width=device-width, initial-scale=1.0` — mobile ready |
| 4 | Open Graph (og:title, og:description, og:image, og:type) | ⚠️ Partial | Present but **og:image is a relative path** (`brand_assets/social%20share.jpg`) — must be absolute URL for proper Facebook/LinkedIn/Discord card rendering |
| 5 | Twitter cards (twitter:card, twitter:title, twitter:description, twitter:image) | ⚠️ Partial | Only `twitter:card="summary_large_image"` — missing title/description/image, so Twitter falls back to OG (which is fine) but explicit is better |
| 6 | `<link rel="canonical">` | ❌ Missing | No canonical tag on homepage. Critical for `www` vs apex consolidation and for legacy forum-showwiki URLs |
| 7 | JSON-LD Schema.org | ❌ Missing | **Zero structured data anywhere.** Biggest single technical-SEO miss. |
| 8 | H1 structure | ✅ | Single H1 (hero promise), well-formed H2/H3 hierarchy per WebFetch |
| 9 | Sitemap.xml | ❌ Missing | `/sitemap.xml` returns 301-loop / not found — Google has to discover everything organically |
| 10 | robots.txt | ❌ Missing | Same — returns redirect chain, not a valid robots file |
| 11 | Mobile responsiveness | ✅ | Tailwind + responsive image variants observed (`800x600` asset preloads); CSS uses `clamp()` for type scaling |
| 12 | Page weight | ⚠️ | Loads Google Fonts (4 families: Bebas Neue, Cinzel, Crimson Pro, UnifrakturCook), Tailwind CDN script, inline styles. **First-paint not measured here** but the multi-family font load + CDN Tailwind = ~150–300ms unnecessary blocking |
| 13 (bonus) | URL hygiene | ❌ | Legacy wiki uses `/forums/showwiki.php?title=X` query-string URLs — these dilute SEO authority across the site. Clean `/wiki/realms/tuornen/` paths would compound link equity. |
| 14 (bonus) | HTTPS + HSTS | ✅ | nginx/1.29.8, 301 redirect to https consistently |

**One-line verdict:** *Solid head meta but missing every structured-data signal, no sitemap, no canonical, legacy wiki URLs leak authority — currently optimised at maybe 40% of what the same site could be with a redesign.*

---

## 4. Schema.org Recommendations

Top three @types to implement, in order of priority:

### Priority 1 — `Game` (root entity, on homepage)

```json
{
  "@context": "https://schema.org",
  "@type": "Game",
  "name": "Birthright Campaign Setting",
  "alternateName": ["Birthright", "BRCS"],
  "url": "https://birthright.net/",
  "image": "https://birthright.net/brand_assets/social-share.jpg",
  "description": "A D&D campaign setting where players rule kingdoms, command armies, and shape the fate of Cerilia.",
  "author": { "@type": "Organization", "name": "TSR / Wizards of the Coast (original IP); birthright.net fan community (stewardship)" },
  "datePublished": "1995",
  "genre": ["Tabletop RPG", "Fantasy", "Political fantasy", "Domain-management"],
  "gamePlatform": ["Dungeons & Dragons 2nd Edition", "Dungeons & Dragons 3.5 (BRCS)", "Dungeons & Dragons 5th Edition (community conversion)"],
  "gameLocation": { "@type": "Place", "name": "Cerilia, Aebrynis" },
  "characterAttribute": ["Bloodline", "Regency", "Domain"]
}
```

### Priority 2 — `Article` + `BreadcrumbList` (every wiki page)

Each wiki article (realm, character, mechanic) gets:
```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Tuornen",
  "about": { "@type": "Place", "name": "Tuornen", "containedInPlace": { "@type": "Place", "name": "Anuire, Cerilia" } },
  "isPartOf": { "@type": "Game", "name": "Birthright Campaign Setting" },
  "datePublished": "...",
  "dateModified": "...",
  "author": { "@type": "Organization", "name": "Birthright.net Community" }
}
```
Plus `BreadcrumbList` for the *Home → Wiki → Realms → Anuire → Tuornen* path. Google rewards breadcrumb schema with prettier SERPs.

### Priority 3 — `Place` (realms, regions) + `Person` (rulers, awnsheghlien) + `Book` (BRCS chapters)

- `Place` for each realm/region/province — `containedInPlace` chains to build a hierarchy (Province → Realm → Region → Cerilia → Aebrynis)
- `Person` for major NPCs (rulers, awnsheghlien) with `characterAttribute` for bloodline/regency
- `Book` (subclass of `CreativeWork`) for each BRCS chapter and original TSR supplement

**Notes on schema research:**
- Schema.org doesn't have a dedicated "fictional setting" type, but the `Game` + `Place` + `CreativeWork` + `Person` combination is the established pattern (see schema.org issue #335 on VideoGameSeries using gameLocation).
- Wikia/Fandom defined a `wikia:VideoGame` subtype — Birthright is not a video game (excepting Gorgon's Alliance), but the modelling pattern (CreativeWork + nested Place/Character) is the right one.
- `VideoGame` should be used **only** on a dedicated `/legacy/gorgons-alliance/` page for that 1996 title.

---

## 5. Internal-Linking Strategy

The redesign creates a chance to fix the worst current problem: **`/forums/showwiki.php?title=X` URLs dilute authority across query-string variants.** Move to clean paths and use a hub-spoke model.

**Hub pages** (the canonical URLs receiving most internal links):
- `/` (homepage)
- `/world/` (Cerilia overview hub)
- `/rules/` (domain rulership hub)
- `/wiki/` (encyclopaedia hub)
- `/tools/` (calculators + maps hub)

**Spoke pages** (deep content linking back to hubs):
- `/world/anuire/tuornen/` → links to `/rules/domain-turn/`, `/wiki/realms/`, `/tools/cerilia-map/?focus=tuornen`
- `/rules/holdings/source-holdings/` → links to `/wiki/magic/mebhaighl/`, `/rules/domain-turn/`
- Every wiki article links to **at least one tool action** ("calculate regency for this realm" / "see this on the map") — anti-dead-end policy
- Every realm page links to its **rulers**, **awnsheghlien threats**, **bordering realms**, and the **regional history**

**301 redirects from legacy URLs:**
- `forums/showwiki.php?title=Tuornen` → `/wiki/realms/anuire/tuornen/`
- `forums/showwiki.php?title=BRCS:Chapter_five_Ruling_a_domain_X` → `/rules/domain-turn/` (consolidated)
- Preserve link equity from 20+ years of inbound links.

**External-linking opportunities:**
- Wikipedia → external links section already includes birthright.net; verify deep-link to canonical home, not legacy URL
- DriveThruRPG (Birthright reached Platinum 2023) — cross-link from BRCS product page to birthright.net rules content
- Matt Colville's MCDM forum / Reddit r/DungeonMasters — soft-outreach with the Cluster-4 comparison page

---

## 6. Five "Build One Page to Rank for One Query" Pitches

| Pitch | URL slug | Target query | Why this works |
|-------|----------|--------------|----------------|
| **The Original Domain-Management D&D Setting** — comparison of Birthright vs Kingdoms & Warfare vs Pathfinder Kingmaker vs Reign vs Kingdom RPG. 2K words, comparison table, embedded Cerilia map preview, BRCS 5E conversion download. | `/rules/domain-management-d-and-d/` | `kingdom management d&d 5e` | Cluster 4 — biggest unfair-invisibility win; positioning is uncontestable |
| **Cerilia: Interactive Map of the Continent** — pannable Leaflet/MapLibre map with all provinces, realms, rulers, bloodlines as clickable layers. Toggle by region / allegiance / bloodline derivation. | `/tools/cerilia-map/` | `cerilia map` / `birthright map` | Tool page = SEO unicorn; mapgears proves demand; pulls returning GM traffic |
| **The Awnsheghlien — D&D's Original Dark Lords** — long-form atmospheric piece on the Blooded of Darkness: the Gorgon, the Spider, the Banshegh, the Sphinx, the Manslayer. Reclaims from 1d6chan and TVTropes. | `/world/awnsheghlien/` | `awnshegh` / `awnsheghlien` | Unique Birthright vocabulary; high-intent searchers; aesthetically perfect for the redesign's atmospheric strategy |
| **Birthright: A 29-Year Stewardship of D&D's Most Ambitious Campaign Setting** — history page, fan project timeline (BRCS 3.5 conversion, 5E conversion, DriveThruRPG Platinum 2023, etc), how to contribute. | `/about/history/` | `birthright revival` / `dormant TTRPG settings` | Reframes dormancy as moat; primes journalist outreach; lands the OSR-curious reader |
| **Bloodline Derivations of Cerilia — The Six Sources and What They Mean** — Anduiras, Brenna, Basaïa, Reynir, Vorynn, Azrai. With derivation-prevalence map (which realms/peoples carry which bloodline), character-creation guidance, and tool link to the bloodline generator. | `/rules/bloodlines/` | `bloodline derivation` / `bloodline d&d` | High-intent player query; consolidates the BRCS Chapter 2 content currently scattered under showwiki URLs |

---

## Sources

- [BIRTHRIGHT.NET](https://birthright.net/)
- [BRCS:Chapter five/Ruling a domain/Domain action rounds — Birthright.net](http://www.birthright.net/forums/showwiki.php?title=BRCS:Chapter_five_Ruling_a_domain_Domain_action_rounds)
- [BRCS:Chapter two/Blood and regency/Bloodline derivation — Birthright.net](http://www.birthright.net/forums/showwiki.php?title=BRCS:Chapter_two_Blood_and_regency_Bloodline_derivation)
- [Awnshegh — Birthright.net](http://www.birthright.net/forums/showwiki.php?title=Awnshegh)
- [Tuornen — Birthright.net](http://www.birthright.net/forums/showwiki.php?title=Tuornen)
- [Mhoried — Birthright.net](http://www.birthright.net/forums/showwiki.php?title=Mhoried)
- [Diemed — Birthright.net](http://www.birthright.net/forums/showwiki.php?title=Diemed)
- [Anuire — D&D Lore Wiki / Fandom](https://dungeonsdragons.fandom.com/wiki/Anuire)
- [Cerilia Map — gm.mapgears.com](https://gm.mapgears.com/birthright-map/)
- [Matt Colville's Kingdoms & Warfare — Wargamer.com](https://www.wargamer.com/dnd/matt-colville-supplement-kingdoms-and-warfare)
- [Player Kingdom Management 5E Supplement — D&D Beyond Forums](https://www.dndbeyond.com/forums/dungeons-dragons-discussion/homebrew-house-rules/71664-player-kingdom-management-5e-supplement-for)
- [Design Diary: 5e Domain Rulership — Brandes Stoddard](https://www.brandesstoddard.com/2017/10/design-diary-5e-domain-rulership/)
- [Birthright 5E Conversion (Marsupialmancer) — GMBinder](https://www.gmbinder.com/share/-L4h_QHUKh2NeYhgD96A)
- [Birthright: The Gorgon's Alliance — GameFAQs](https://gamefaqs.gamespot.com/pc/196764-birthright-the-gorgons-alliance)
- [Game — Schema.org Type](https://schema.org/Game)
- [VideoGame — Schema.org Type](https://schema.org/VideoGame)
- [CreativeWork — Schema.org Type](https://schema.org/CreativeWork)
- [Gaming Website SEO Recommendations: Schema Markup — Playwire](https://www.playwire.com/blog/gaming-website-seo-recommendations-how-to-use-schema-markup)
- [Birthright (campaign setting) — Wikipedia](https://en.wikipedia.org/wiki/Birthright_(campaign_setting))
- [What a community-led shift to independent fan wikis means for game developers — Game Developer](https://www.gamedeveloper.com/marketing/what-a-community-led-shift-to-independent-fan-wikis-means-for-game-developers)
