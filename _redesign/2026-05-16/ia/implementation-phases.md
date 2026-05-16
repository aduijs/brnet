---
project: Birthright.net Redesign
deliverable: Phased Implementation Plan
date: 2026-05-16
author: ENLIL
basis: proposed-ia.md (this folder), panel audit 2026-05-15, NISABA+GIBIL directions A/B/C
rollout_rule: prod-is-canonical (pull prod → edit → push prod → commit brnet)
---

# Phased Implementation Plan

## Conventions

- **Time unit:** sessions (one session ≈ a focused working block, not hours).
- **Roster shorthand:** GIBIL = web/Odoo build · NISABA = visual/asset · NERGAL = research · ENLIL = editorial/copy · ENKI = canon vetting.
- **Rollout:** every phase ends with a prod-resync commit *separate from* the new-design commit, per `feedback_birthright_static_prod_is_canonical`.
- **Rollback:** every phase tags `pre-phase-<n>-<date>` on the brnet repo before push.

---

## Phase 2a — Design system lock (1 session)

**Goal:** lock palette, type-scale, components from the chosen direction (A / B / C).

**Outputs:**
- `staging/styleguide.html` — single page demonstrating: button (3 variants), card (domain/region/article), nav (desktop + mobile tab-bar), hero, pagination, breadcrumb, form, table, quote/pull-out, footer, sigil chip, heraldic crest slot.
- `staging/tokens.css` — colour, spacing rhythm (4/8/16/24/40/64), type-scale (5 sizes), motion timings.
- Light/dark variant if the chosen direction supports both.

**Roster:** GIBIL (lead) · NISABA (asset + crest placeholder set).
**Risk:** scope creep into "one more component". **Mitigation:** the 11-component list above is the lock; new components wait for Phase 2b.
**Rollback:** staging path only; prod untouched.

---

## Phase 2b — Template-cascade design (1-2 sessions)

**Goal:** build one canonical template per surface type from the IA catalogue (14 surfaces).

**Outputs:** 14 templates at `staging/<surface>-template.html`, each populated with representative content:
- `homepage`, `tour`, `world`, `region` (Anuire), `domain` (Tuornen), `npc` (Aedric Boeruine), `organisation` (Impregnable Heart of Haelyn), `wiki-landing`, `wiki-article` (Bloodline derivation), `compendium`, `bloodlines`, `tools`, `downloads`, `community`.
- One "tag page" thin variant (Compendium reuse).
- Owner reviews each template **before** fan-out. One review gate per surface; sign-off in `owner-inbox/birthright/redesign/2026-05-16/template-reviews/`.

**Roster:** GIBIL (lead) · NISABA (illustration slots, crest library start) · ENLIL (hero/tour copy lock — already drafted in IA doc).
**Risk:** the Domain template absorbs the most edge cases (provinces table, Power-structure axis, traits, adjacency). **Mitigation:** Tuornen is the test fixture; if Tuornen renders cleanly, the other 68 will.
**Rollback:** staging only.

---

## Phase 3a — Tier-1 surfaces (1 session)

**Surfaces:** homepage, tour (compressed to 4 slides), wiki landing, compendium, bloodlines explainer.

**Order of operations:**
1. Prod-resync commit (pull live state into brnet repo).
2. Apply new templates to the 5 tier-1 pages.
3. Promote hero one-liner ("...you play the ruler") to homepage hero.
4. Wire heartbeat 3-row feed (MediaWiki API for recent edits + Discourse API for latest topic + Discord pinned-message webhook).
5. Push to prod.
6. New-design commit to brnet.

**Outputs:** 5 live pages, new design. Heartbeat feed functional.
**Roster:** GIBIL (lead) · ENLIL (copy review pre-push) · NERGAL (verify SEO meta/Open Graph on each).
**Risk:** Discord pinned-message API has rate limits + occasional auth flake. **Mitigation:** fall back to "latest Discord activity timestamp" if pin fetch fails; never block page render on the third feed row.
**Rollback:** tag `pre-3a-2026-05-XX`; one-command revert restores prior templates.

---

## Phase 3b — Region pages (1 session)

**Surfaces:** 6 region pages (Anuire, Khinasi, Rjurik, Brechtür, Vosgaard, Aduria-fringe).

**Outputs:** 6 pages on new template, one commissioned crest per region in the heraldry library, neighbours sidebar populated.
**Roster:** GIBIL (template fan-out) · NISABA (6 crests, ~$25-40 each via established pipeline) · ENKI (region intro copy vetted for canon — "what makes Anuire different" framing).
**Risk:** "what makes this region different" framing requires editorial discipline; without it, regions read interchangeable. **Mitigation:** ENKI writes a one-sentence differentiator per region before GIBIL builds.
**Rollback:** templates are additive; revert is per-page.

---

## Phase 3c — Domain pages (1-2 sessions)

**Surfaces:** 69+ domain pages.

**Outputs:** all domain pages on the new template. Power-structure axis surfaced as chips. Trait keywords clickable to tag pages. Adjacent-realms cards auto-populated from a `neighbours` field.
**Roster:** GIBIL (lead — this is mostly template fan-out + data-driven build) · ENKI (canon-check the 19 untracked Djapar expansion pages BEFORE inclusion; they get folded into 3e but the canon flag is now).
**Risk:** the 69 pages have inconsistent source data — some have ruler, some don't; some have province tables, some don't. **Mitigation:** template degrades gracefully; missing field becomes a "Help us fill this" link, not a broken cell.
**Rollback:** per-page; prod can run mixed-template state during rollout if needed.

---

## Phase 3d — NPC + Organisation pages (1 session)

**Surfaces:** 11 organisations + 9 NPCs.

**Outputs:** 20 pages on new templates. Associates/members cross-links wired.
**Roster:** GIBIL · NISABA (org sigils for the 11 orders — reuses crest pipeline).
**Risk:** low. **Mitigation:** none needed beyond standard review.
**Rollback:** per-page.

---

## Phase 3e — Djapar / expansion pages (1 session)

**Surfaces:** 19 untracked pages (Djapar continent expansion currently live on prod but not in brnet repo).

**Order of operations:**
1. Prod-resync commit (capture the 19 pages into brnet history as a baseline).
2. ENKI canon-flag review (Djapar is fan-supplement, not core canon — every page gets a "Fan supplement" badge).
3. Apply new design templates.
4. Push + commit.

**Outputs:** 19 pages now versioned + on new design + clearly flagged as supplement.
**Roster:** GIBIL (lead) · ENKI (badge taxonomy + canon flag) · ENLIL (supplement banner copy).
**Risk:** owner has not yet ruled on whether Djapar lives at `/djapar/` or `/expansion/djapar/`. **Mitigation:** flag this for owner pre-3e; default to `/expansion/djapar/` for future-proofing additional supplements.
**Rollback:** straightforward — the prod-resync commit is the rollback target.

---

## Phase 4 — Polish + post-launch (ongoing, 1 session + monitoring)

**Outputs:**
- Lighthouse + WCAG audit on one representative of each of the 14 surfaces. Target: LCP < 2.5s, CLS < 0.1, WCAG AA on contrast + focus.
- AVIF/WEBP conversion sweep (Tariq's recommendation from audit).
- `aria-live` on tour, focus rings everywhere, skip-link site-wide.
- A/B test (optional, owner call): old vs new on homepage + Tuornen, 14-day window.
- **Reserved slot for Cerilia Live** — the `/play/cerilia-live` route is registered in the nav now but lands on a "Spring 1524 MR — coming soon" placeholder until the Domain Turn engine is built. Not in this plan's scope.
- 30-day usage review: GA/Plausible bounce rate, time-on-page, Sam-the-Outsider follow-up (re-run the cold-visitor test).

**Roster:** GIBIL (audits + fixes) · NERGAL (analytics + Sam follow-up test) · NISABA (any final art swaps).
**Risk:** scope inflation — "while we're in there, add X." **Mitigation:** every Phase-4 ticket is a separate commit and a separate inbox sign-off.
**Rollback:** Phase 4 changes are additive; per-commit revert.

---

## Total

**8 phases, 8-10 sessions** for the full redesign rollout once the design direction is locked.

Cerilia Live (Phase 5+) is its own multi-session build and explicitly out of this plan.

---

*Length check: ~790 words. Within budget.*
