---
project: Birthright.net Redesign
deliverable: Proposed Information Architecture
date: 2026-05-16
author: ENLIL
basis: panel audit 2026-05-15 (mean 5.9/6.4, WOW partial, Sam-Outsider No)
palette: agnostic — works for Directions A / B / C
---

# Birthright.net — Proposed Information Architecture

## A. Primary user journeys

Six visitors, two paths each: **primary** (designed-for) and **fallback** (where they recover if the primary is missed).

| Visitor | Goal | Primary path | Fallback |
|---|---|---|---|
| **Sam — Cold first-time** | "What IS this? Can I play?" | Hero one-liner ("you play the ruler") → `Explore › Take the Throne` (90-sec quiz) → drops on a region/domain page with a **"Run a turn here"** CTA. | Hero secondary CTA → Tour (now 4 slides, not 9). |
| **Returning fan** | Re-immerse, find a thing | Hero secondary slot → `Explore › World Map` (clickable SVG of Cerilia). | `Reference › Wiki` direct. |
| **Active DM** | Tools for tonight's session | `Play › Tools` → Bloodline Generator, Heir Generator, Domain Turn helper. | `Reference › Downloads`. |
| **Active player** | My domain + neighbours | Search → domain page → "Adjacent realms" + bloodline trait sidebar. | `Explore › Map` → click region → click province. |
| **Community member** | Forum, pulse, events | `Community` hub → live three-row heartbeat (latest wiki edit / forum topic / Discord pin) + "Next play night". | Persistent Discord button (footer + corner). |
| **Contributor / editor** | Wiki recent changes | `Reference › Wiki` → "Recent edits" + "Needs attention" columns on landing. | Footer "Edit this page" on every wiki surface. |

**Sam's 3-click guarantee:** Landing → Take the Throne (homepage hero CTA) → Region pick → Domain seed with "Run a turn here". Three clicks. Currently it takes seven and ends on glossary failure.

---

## B. Top-level nav — proposed

**Critique of current 8-item nav** (*The World / Bloodlines / Regions / Tour / Compendium / Wiki / Downloads / Community*): organised by **content type** (regions, bloodlines, wiki), not by **visitor intent**. Tour and Compendium overlap. Bloodlines is a sub-topic masquerading as a top-level peer. Downloads is dead-end utility.

**Proposed nav — 5 items grouped by intent:**

| Slot | Label | Reveals (hover/tap) |
|---|---|---|
| 1 | **Explore** | World Map · Six Regions · Bloodlines · Tour (4-slide) |
| 2 | **Play** | Take the Throne (quiz) · Heir Generator · Bloodline Generator · Domain Turn Helper · *Cerilia Live (Phase 4)* |
| 3 | **Reference** | Wiki · Compendium · Downloads · Glossary |
| 4 | **Community** | Forum (Discourse) · Steward's Notes · Events · Discord |
| 5 | **About** | The Stewards · WotC recognition · Contribute |

**Corner action slot:** `Join Discord` (persistent on desktop; collapses into bottom tab-bar on mobile).
**Search:** persistent global search in nav, keyboard-shortcut `/`.

Rationale: 5 verbs, not 8 nouns. Every existing surface still has a home; the new "Play" group creates a clean slot for the Phase-4 Domain Turn Live without pre-announcing PLANNED graveyards. "About" replaces the audit-flagged anonymity problem (Priya, Jonas).

---

## C. Surface types catalogue

Thirteen surface templates. Every page on the site resolves to one of these.

| # | Surface | Purpose | Primary elements | Secondary / sidebar | CTAs | Routes to |
|---|---|---|---|---|---|---|
| 1 | **Homepage** | WOW + funnel + heartbeat | Hero (one-line value prop in Bloodlines voice) · 90-sec "Take the Throne" interactive · Heartbeat 3-row feed · Region grid · Steward's note | Email capture · Discord | Take the Throne (primary) · Explore the Map (secondary) | Region pages, Tools, Wiki |
| 2 | **Tour** | Onboarding — 4 slides not 9 | Slide 1: "you play a ruler" · Slide 2: bloodline · Slide 3: domain turn · Slide 4: "where next" branch | aria-live region announcer · keyboard nav | "Take the Throne" / "Open the Map" | Homepage CTAs |
| 3 | **World Hub** (`/world`) | Atmospheric portal | Clickable SVG map · Six-Region card grid · Bloodlines teaser | Steward note · "Random domain" | Region page · Domain page | Region, Domain |
| 4 | **Region page** | Atmospheric mid-level | Region intro (what makes it different) · Realm grid (down) · Neighbour regions (sideways) · One commissioned crest | Map mini-thumb · Cultural axis (feudal / norse / mercantile / gothic) | "Pick a province" | Domain pages |
| 5 | **Domain page** | Canonical detail | Heraldic crest · Ruler · Province table · Power-structure axis (Sources/Law/Temples/Forests) · Bloodline trait chips · Adjacent realms cards | "Last vetted" stamp · Edit-history link · Maintainer byline | "Run a turn here" · "View on map" | NPCs, Org, Region (up), Adjacent (across) |
| 6 | **NPC page** | Bio + ties | Portrait/crest · Bio · Bloodline derivation · Domain ties (up) · Known associates (across) | Timeline if applicable | "View domain" | Domain (up), Other NPCs (across) |
| 7 | **Organisation page** | Order/temple/guild | Sigil · Type (temple/guild/source) · Influence map · Notable members | Holdings rating | "View members" | NPCs, Domains where active |
| 8 | **Wiki landing** | Search + browse + recent | Search field (1-char threshold, 150ms debounce) · 3 columns: Popular / Recently edited / Random domain | Tag cloud · Needs-attention queue | "Edit this page" | Wiki article |
| 9 | **Wiki article** | Canonical reference | Article body · Breadcrumb · Last-edited stamp · Edit link | "See also" sidebar | "Edit" · "Discuss" | Adjacent articles |
| 10 | **Compendium index** | Taxonomic gateway | Clickable filter chips ("50 Domains" → filter) · Faceted axes (region × alignment × trait) | Tag pages link | "Compare domains" | Domain, NPC, Org pages |
| 11 | **Bloodlines explainer** | System hybrid | 6 derivation modules · Each links to "domains with this bloodline" | Grimoire framing · Crest examples | "Generate a bloodline" | Heir Generator, Domain pages |
| 12 | **Tools index** (`/play`) | Tool hub | Tool cards (Bloodline Gen, Heir Gen, Domain Turn Helper, Cerilia Live placeholder) | "Suggest a tool" | Open tool | Tool surfaces |
| 13 | **Downloads index** | PDFs, maps, sheets | Categorised: Rules / Maps / Sheets / Adventures · Each with size + last-updated | License notes | Download | Wiki articles where referenced |
| 14 | **Community signpost** | Forum + Discord + pulse | Heartbeat feed · Latest forum topics (Discourse API) · Events ("next play night") · Steward's Notes column | Discord embed | Open thread · Join Discord | Forum, Discord |

(14 because Wiki landing and Wiki article are different templates — same intent, different layout.)

---

## D. Crosslinking + navigation rules

**Universal rules (enforced by template):**

1. **Up-link.** Every detail page has a breadcrumb back to its parent surface. Domain → Region → World. NPC → Domain → Region. Org → Region (primary seat).
2. **Sideways links.** Every Domain page ends in 3-4 "Adjacent realms" cards. Every NPC page ends in 2-3 "Known associates." Every Org page ends in "Members" + "Active in".
3. **Across-axis links.** Domain-trait chips (Ancient Forests, Guerrilla Warfare, Powerful Source Holdings) are **tag pages** that aggregate every domain sharing that trait. New surface type — but a thin one, reuses Compendium template.
4. **Random affordance.** Every empty/zero-state and 404 surfaces a `Random domain →` / `Random NPC →` / `Random article →` button. Generalised from the existing wiki pattern.
5. **Footer = 3-column.** *Explore* (Map / Regions / Bloodlines) · *Play* (Tools / Take the Throne / Domain Turn Helper) · *Community* (Forum / Discord / Steward).
6. **Breadcrumb pattern.** `World ▸ Anuire ▸ Tuornen` (already present on Tuornen, generalise to all detail surfaces).
7. **"See in compendium" deep-link** from every tour slide (Marcus's fix).

---

## E. Empty state, 404, search-no-results philosophy

**One rule:** A visitor never lands on a dead end. Every zero-state offers **three doors**:

| Surface | "Door 1" | "Door 2" | "Door 3" |
|---|---|---|---|
| Wiki "no results" | Popular searches | Recently edited | Random domain |
| 404 | Take the Throne | Open the Map | Search the Wiki |
| Tools index (Phase 2/3, pre-Cerilia-Live) | Bloodline Generator | Heir Generator | Forum thread "what would you build?" |
| Compendium filter "no match" | Clear filters | Random domain | Compendium home |
| Domain page with missing field ("ruler unknown") | "Help us fill this" link to wiki edit | Adjacent realms | Region page |

The audit's "Create this article →" anti-pattern is eliminated. Contribution CTAs only appear for visitors who reached the page **via** a contributor path (wiki edit log, Recent Changes feed) — never as the only escape route on a cold landing.

---

## F. Mobile-first considerations

The mobile nav was hardened today (95 files, opaque-bg fix). The new IA assumes mobile is the default render target:

- **Bottom tab-bar (mobile)** — 5 icons matching the 5-item top nav: Explore · Play · Reference · Community · Search. Persistent. Thumb-reachable. App-shaped, because TTRPG fans live on phones during sessions.
- **Hamburger** is **secondary**, not primary — opens a full-screen drawer with About / Stewards / Downloads / Legal.
- **Search** — mobile: dedicated tab-bar icon → full-screen overlay. Desktop: persistent in header + `/` shortcut.
- **"Random domain" as delight** — surfaces in tab-bar overflow ("✦ Surprise me") and on every empty state. Not buried.
- **Heartbeat feed on mobile homepage** — 3 rows max above the fold (latest wiki edit / forum topic / Discord pin), each tappable, each 60-char excerpt.
- **Hero on mobile** — single CTA only ("Take the Throne"). Secondary CTAs collapse into a "More ways in →" expander.
- **Map on mobile** — pinch-zoom SVG with snap-to-region; tap region → region page; long-press region → quick-look province card.

---

## Two non-negotiables before fan-out

1. **The hero one-liner is the same across all three design directions.** Whatever is chosen, the first sentence on the homepage is *"In Birthright, you don't play the adventurer. You play the ruler."* The audit found this is the single sentence that triggers the WOW; the IA cannot let any design direction bury it again.
2. **The "Play" nav slot exists from day one — even if it only contains placeholders.** This is where Cerilia Live lands in Phase 4. If we ship without that slot present, retrofitting it later costs nav churn and creates a second "PLANNED graveyard." Better to ship the slot with two real tools (Bloodline Generator + Heir Generator) and a *"More coming"* card than to omit the category.

---

*Length check: ~1,490 words. Within budget.*
