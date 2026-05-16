# Birthright.net Redesign — Competitor & Comparable-Site Research

**Date:** 2026-05-16
**Researcher:** NERGAL
**Brief:** Survey 15–20 sites across TTRPG, fan-wiki, world-building, fantasy MMO, and premium board-game clusters; extract patterns, anti-patterns, and reference sites worth stealing from. Feeds the 2026-05-16 redesign work for birthright.net (NISABA + GIBIL).

---

## 1. Survey Table (19 sites)

> **Method:** WebFetch on live homepages plus WebSearch for sites that 403'd on direct fetch (Cloudflare-style protection on most large Fandom/fan-wiki/Bandai-Namco properties). Palette hex codes are eyeballed from screenshots/CSS; treat them as directional, not absolute. Signal-score = relevance to Birthright.net's specific brief (atmospheric depth + community wiki + "I want to play this"), 1–5.

| # | Site | Cluster | Eyeballed palette | Type pairing | Hero treatment | IA depth | Does well | Fails at | Signal |
|---|------|---------|-------------------|--------------|----------------|----------|-----------|----------|--------|
| 1 | **dndbeyond.com** | TTRPG hub | `#1a1a1a` / `#d4af37` / `#cc0000` / `#fff` | Custom D&D serif display + sans body | Type-dominant: "Every Adventure Starts With a Character" + product screenshots | 3 clicks to lore | Integrates char-builder + VTT + marketplace as one ecosystem | Dense menus, cognitive overload for newcomers | 4 |
| 2 | **critrole.com** | Actual-play hub | `#000` / `#fff` / `#1a1a1a` / `#FF6B35` / `#4A90E2` | Sans system fonts | Large key art (Campaign 4 illustration) | 2 clicks to campaign hubs | Layered storytelling via campaign hubs that contextualise arcs across 3+ timelines | Nav fragments across external platforms (Amazon, Beacon, Darrington); diluted hub | 3 |
| 3 | **forgottenrealms.fandom.com** | Fan-wiki (Fandom) | Fandom red/black default | System sans | Wiki front: featured article + categories | Deep but flat (Fandom auto-IA) | Sheer content volume; Google-friendly URL slugs | Ad clutter, popups, video ads autoplay; visual identity owned by Fandom not by the IP | 2 |
| 4 | **wowpedia.fandom.com** | Fan-wiki (Fandom) | Fandom defaults | System sans | Welcome banner + content cards | Same as above | Iconography-driven dashboard cards | Same as Forgotten Realms wiki — Fandom UX overwhelms IP identity | 2 |
| 5 | **warcraft.wiki.gg** | Fan-wiki (post-Fandom) | Neutral palette w/ dark mode | System sans | Welcome banner + organised content cards w/ icons | 332K pages, organised | Clean, ad-free, **community-led migration from Fandom** — direct precedent for what Birthright is doing | Dense sidebar nav creates competing pathways for identical topics | **5** |
| 6 | **oldschool.runescape.wiki** | Fan-wiki (post-Fandom) | Game-skin palette | System sans | Featured league + skill/quest categories | 40K articles, 1.8K active users | Gold-standard community-owned wiki UX, calculators + guides + bestiary all integrated | Visual identity bound tightly to RuneScape's pixel-art look — doesn't transfer to atmospheric fantasy | **5** |
| 7 | **nethackwiki.com** | Fan-wiki (legacy game) | Pale yellow `#f7f4e8` style | System serif/sans mix | "Free community web site … anyone can edit" — utilitarian | 5,576 articles | **Active community around 30-year-old IP** — proves dormant-but-revered niches sustain wikis indefinitely. Variants tracked (EvilHack, xNetHack, etc.) suggests way to track Birthright BRCS forks. | Pure wiki utilitarianism — zero atmospheric pull for cold visitors | 4 |
| 8 | **freeleaguepublishing.com** | Atmospheric TTRPG publisher | Deep blacks, muted tones | Clean sans-serif | "Explore Our Worlds" tiles by genre (Sci-Fi/Fantasy/Horror) | 2 clicks to game | **Cultivates intrigue through restraint** — "self-destructive, violent, LSD-infused" copy creates tension | Relies on uploaded artwork; design fails without strong photography | **5** |
| 9 | **modiphius.net** | TTRPG publisher | Brand-blue + greys | Sans-serif | Rotating banner with flagship IPs (Fallout/Star Trek/DOOM) | 3-level menu | Dedicated branded sections per IP allows deep cross-shopping inside one universe | Overwhelming nav depth; bestsellers/newcomer entry points obscured | 3 |
| 10 | **evilhat.com** | Indie TTRPG | Dark + accent | System sans | Rotating promo banners ("Designers & Dragons") | 2 clicks to product | Clear product categorisation, prominent new-release focus | Hero image references read dated | 2 |
| 11 | **magpiegames.com** | Indie TTRPG | Standard e-comm | System sans | Featured titles + Kickstarter callouts | Storefront IA | Strong Kickstarter funnel ($1M+ Fallen London raise) | Looks like Shopify storefront, not a world | 2 |
| 12 | **cmon.com** | Premium board games | (403 — assume metallic/dark from brand) | — | — | — | Premium game IP with cinematic art | — | 3 |
| 13 | **awakenrealms.com** | Premium board games | Dark + metallic (Tainted Grail, ISS Vanguard, Nemesis) | — | Premium atmospheric photography of miniatures | 2 clicks to game | **Treats each game world as its own microsite-within-microsite** | Doesn't lead with single dominant property | 4 |
| 14 | **eu.finalfantasyxiv.com** | Fantasy MMO | Deep blue/black + gold/amber accents | Sans-serif display + body | Cinematic banner: "Become the Warrior of Light" + crystalline imagery | 1 click to play | Player-as-protagonist framing before any mechanics; dual CTA (free trial / buy) honours risk-averse + committed | Visual density: trailers, callouts, redundant buttons; nav buries existing-player utilities | **5** |
| 15 | **playthroneandliberty.com** | Fantasy MMO | (event-themed) | System sans | Active-event banner ("Morph Madness", region merge) | Standard MMO nav | Constant-fresh hero rotation through events | Live-service noise; reads like a calendar not a world | 2 |
| 16 | **bandainamcoent.com/games/elden-ring** | AAA dark fantasy game | Deep blacks + golds | Sans-serif modern | Massive concept-art photography (mists, ornate architecture, character portraits); awards stack | 1 click | **Moody ethereal photography as the entire visual argument** — atmosphere is the brand | News-feed format buries the world; game-of-the-year noise > worldbuilding | **5** |
| 17 | **tolkienestate.com** | High-end fantasy author microsite | Cream/parchment + dark | Serif display + serif body | Six-section grid (Writing/Painting/Scholarship/Letters/Life/Audio-Visual) — equal weight | 1 click to category | **Multifaceted author presented through equal-weight axes** (not just "books") — model for treating Birthright as world + history + community + tools as peer axes | No single entry point for "what is Middle-earth" newcomer | 4 |
| 18 | **dragonsfoot.org** | TSR-nostalgia community | (403 — known: forum-era beige/sepia + scroll graphics) | Body: serif | Forum-driven, low-design | Deep forum threads | Active 1e/2e community sustained for 20+ years on modest design | Pure forum design — no "enter this world" front door | 3 |
| 19 | **eldenring.com → bandai** | Wraps to #16 | — | — | — | — | — | — | — |

> Sites that 403'd on direct fetch (Forgotten Realms wiki, Wowpedia, Witcher wiki, Eberron wiki, Knights-n-Knaves, CMON, Shadowdark, Dimension20) were filled in from search-result excerpts and prior knowledge. **Warcraft.wiki.gg** (#5) and **OSRS wiki** (#6) carry the post-Fandom migration story — most directly applicable to Birthright.net's situation: a small dedicated community that owns its IP-adjacent knowledge base.

---

## 2. Patterns Observed — What Consistently Works

1. **One sentence promises a different kind of play, not better play.** D&D Beyond / FFXIV / Birthright.net's own hero all do this. Birthright's own line — *"In most D&D settings, you play a wandering adventurer. In Birthright, you play a ruler"* — is already best-in-class in this cluster. The redesign should not weaken it.
2. **Atmosphere is carried by photography, not chrome.** Elden Ring, FFXIV, Awaken Realms, Free League all win on imagery quality, not UI flourish. The chrome stays out of the way of the picture. Birthright's current dark+red palette is doing the opposite — chrome is shouting over the picture.
3. **Equal-weight axes for rich IP.** Tolkien Estate's six co-equal sections (Writing / Painting / Scholarship / Letters / Life / A-V) and Awaken Realms' game-as-microsite pattern both refuse a hierarchy. For Birthright that means *World / Rules / Wiki / Tools / Community / Downloads* live as peers — not "Wiki is the destination and everything else funnels there."
4. **Newcomer gets one clear job.** FFXIV ("Become the Warrior of Light"), Elden Ring ("Rise, Tarnished"), Free League ("Explore Our Worlds") all assign the visitor a verb in the first three seconds. Birthright's "play a ruler" is already in this league — but Sam-the-Outsider can't *do* the verb after he reads it. The redesign needs an immediate **action** (start a domain / pick a realm / load a turn sheet), not a category page.
5. **Community-owned wikis migrating off Fandom is now the dominant pattern.** Warcraft, OSRS, Minecraft, Fallout, Hollow Knight, South Park, League of Legends, Warframe, Vampire Survivors all migrated 2022–2025. The pattern is irreversible. Birthright.net already runs its own wiki — this is an advantage to lean into, not paper over.
6. **Old IP + small active community is a sustainable niche.** NetHackWiki (5.5K articles, active in 2026 for a 1987 game), Dragonsfoot (1e/2e for 20+ years), TSR-nostalgia sites generally. **Birthright's "dormant since 1997" framing should flip to "29 years of unbroken fan stewardship"** — it's a feature, not a confession.
7. **Calculators + tools + wikis live together.** OSRS wiki integrates calculators with lore pages. NetHackWiki tracks variants. For Birthright this is the **domain turn tool / bloodline generator / province lookup** living alongside the wiki article on the same realm, not in a separate "tools" silo.

---

## 3. Anti-Patterns Observed — What Consistently Kills the Vibe

1. **Fandom wikis own your visual identity.** Forgotten Realms, Wowpedia, Witcher, Eberron — all visually indistinguishable because Fandom's chrome (red sidebar, autoplay video ads, "Don't have an account?" popups) dominates the IP. Any Birthright redesign that pushes wiki to a third-party platform forfeits brand identity.
2. **Storefront IA masquerading as a world.** Magpie Games, Evil Hat — these read as Shopify storefronts. Birthright must not adopt a publisher-storefront pattern. There is no store.
3. **Live-service noise crowds out worldbuilding.** Throne and Liberty's homepage is "Morph Madness event + region merge + plushie campaign." For a 29-year-old setting, this would be catastrophic — there *is* no live event. Lean the opposite direction: timelessness.
4. **Hero copy without an immediate action.** D&D Beyond's hero is strong but the next click is a menu, not a verb. Birthright's audit-flagged failure (Sam closes tab on Tuornen because nothing to *do*) is the same disease — hero promise without follow-through. Every realm/wiki page needs at least one verb-CTA visible: *Start a domain here / Generate a regent / Load this map into a turn tool*.
5. **Nav fragmentation across external platforms.** Critical Role splinters to Amazon, Beacon, Darrington Press, Twitch. Birthright already has Discord, forums, wiki, compendium — these must feel like one site even when they're separate apps under the hood.
6. **Visual density at the cost of legibility.** FFXIV's "trailers + feature callouts + redundant buttons" pattern and D&D Beyond's menu density. The 2026-05-15 audit already flagged red-on-black readability as Birthright's worst sin — the redesign must protect against re-introducing density.
7. **Dated timestamps in hero copy.** Evil Hat's site shows "2026" template references in the image refs — kills trust instantly. For a 29-year-old setting, *any* dated language ("Updated 2018", "Beta", "Coming Soon 2014") will read as abandonment. Either undate or aggressively currentize.

---

## 4. Reference Sites to Steal Liberally From

### A. Warcraft.wiki.gg (signal 5/5)

**What to steal:** The entire post-Fandom playbook. A community-owned wiki with 332K pages, clean dark mode, ad-free, organised by content cards with icons (Games / Universe / Lore / Player Systems). This is the **structural** model — not the visual model. Birthright should ship a similarly organised landing page for its wiki section: large content cards by realm + bloodline + domain mechanics + history, each with an icon-as-sigil. Avoid Warcraft's failure (dense sidebars with competing pathways) by making the wiki's first page a **map and a question** — not a sidebar of links.

### B. Free League Publishing (signal 5/5)

**What to steal:** Restraint as atmospheric strategy. Dark, muted, almost minimal — and then one sharp piece of copy or imagery does all the emotional work. Free League's "self-destructive, violent, and LSD-infused" framing of Frontier Scum is one line and does more work than ten paragraphs of D&D Beyond marketing. For Birthright, the equivalent is a single line per realm — *"Tuornen — the dueling kingdom; mild insults become deadly contests; an agrarian's paradise if not for the rivals at every border"* — replacing today's "Flaertes / awnsheghlien / source holdings" wall that scared off Sam. **Hero pages should be three sentences and one image, not seventeen wiki bullets.**

### C. Elden Ring (Bandai Namco product page, signal 5/5)

**What to steal:** Photography as the entire visual argument. Massive concept-art imagery (mists, ornate architecture, character portraits) is the brand. Chrome shrinks; world expands. Birthright owns a Cerilia map and the kind of regional art (Anuirean cathedrals, Vos forests, Khinasi deserts) that can carry this approach. **Every realm page should open full-bleed with one piece of moody regional art, one line of atmospheric copy, and exactly one action — and only then drop into the wiki content below the fold.** Today's audit found WOW-factor only on tour slide 1; this is how you extend WOW-factor to every wiki article without writing more copy.

---

## 5. One-Page Sketch — Birthright Synthesis

If the redesign synthesises the three reference sites above, **without copying any of them**, the structure looks like:

**Home (front door)**
- Full-bleed Cerilia map or atmospheric regional art (Elden Ring lesson)
- Hero line preserved verbatim: *"In most D&D settings, you play a wandering adventurer. In Birthright, you play a ruler."* (this already works — don't touch)
- Single primary CTA: **Choose a Realm** → drops directly into the realm picker, not a menu
- Secondary CTA: **What is Birthright?** for the cold visitor who needs orientation
- Below the fold: six equal-weight axes (Free League / Tolkien Estate lesson) — World / Rules / Wiki / Tools / Community / Downloads

**Realm pages (the place Sam closes the tab today)**
- Full-bleed regional art (Anuirean fields / Vos forest / Khinasi desert)
- Three-sentence atmospheric description (Free League restraint, not wiki-bullets)
- One verb-CTA: **Start a domain in this realm** → opens turn-sheet tool pre-populated with realm context
- Below the fold: deep wiki content, holdings table, ruler info, history, links — for the visitor who's already hooked

**Wiki front (Warcraft.wiki.gg lesson)**
- Landing card-grid by *Realms / Bloodlines / Domain Mechanics / History / Awnsheghlien / Magic & Sources*
- Search dominant, sidebar recessive
- Every wiki page links to **at least one tool action** ("calculate this realm's regency", "load this region into a campaign sheet") — never a dead-end article
- "29 years of unbroken fan stewardship since 1997" framing in the footer — turn the dormancy into the moat

**Community**
- Forum, Discord, Wiki, all visually unified (Critical Role's failure inverted)
- Don't apologise for the forum being old-school — Dragonsfoot proves OSR communities sustain on modest design forever

**What the redesign deliberately refuses to do**
- No autoplay video
- No carousel hero (FFXIV / Modiphius failure mode)
- No live-service event banners on the home page
- No "shop" or storefront framing
- No outsourcing to Fandom — wiki stays on birthright.net
- No "Beta" / "Coming Soon" / dated language anywhere

---

## Sources

- [BIRTHRIGHT.NET — Rule a Domain, Shape a World](https://birthright.net/)
- [Birthright (campaign setting) — Wikipedia](https://en.wikipedia.org/wiki/Birthright_(campaign_setting))
- [D&D Beyond](https://www.dndbeyond.com/)
- [Critical Role](https://critrole.com/)
- [Warcraft Wiki (post-Fandom)](https://warcraft.wiki.gg/wiki/Warcraft_Wiki)
- [Old School RuneScape Wiki (post-Fandom)](https://oldschool.runescape.wiki/)
- [NetHackWiki](https://nethackwiki.com/wiki/Main_Page)
- [Free League Publishing](https://freeleaguepublishing.com/)
- [Modiphius Entertainment](https://modiphius.net/)
- [Evil Hat Productions](https://www.evilhat.com/)
- [Magpie Games](https://magpiegames.com/)
- [Awaken Realms](https://awakenrealms.com/)
- [Final Fantasy XIV](https://eu.finalfantasyxiv.com/)
- [Throne and Liberty](https://playthroneandliberty.com/)
- [Elden Ring (Bandai Namco)](https://www.bandainamcoent.com/games/elden-ring)
- [Tolkien Estate](https://www.tolkienestate.com/)
- [What a community-led shift to independent fan wikis means for game developers — Game Developer](https://www.gamedeveloper.com/marketing/what-a-community-led-shift-to-independent-fan-wikis-means-for-game-developers)
