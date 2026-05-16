# Direction B — Modern Strategic / War Room

## In one sentence
Birthright as **a serious-game operations console** — charcoal panels, amber signal, monospace metadata, the setting framed as something you administer rather than admire.

## Palette
| Role | Hex | Use |
|------|-----|-----|
| Bg base | `#1a1d24` | Page primary — lighter than current `#0b0d12`, less aggressive |
| Bg elevated | `#22262f` | Nav, cards, panel surfaces |
| Bg panel | `#2b3039` | Hero image frame, hover state |
| Line | `#353942` | All borders — single consistent rule weight |
| Text bright | `#fafaf7` | Display, headlines |
| Text | `#e8e6e1` | Body |
| Text dim | `#9a9ba0` | Labels, metadata, mono UI |
| **Amber** | `#d4a04a` | Primary signal — CTA, accent, "ruler" emphasis, live indicators |
| Amber bright | `#e9b35a` | Hover state on amber |
| Marker red | `#c64a3a` | Reserved — Awnsheghlien tag, error states, alert badges only |
| Signal green | `#6bb56b` | "Wiki online" status dot, heartbeat indicators |

## Typography
| Role | Family | Why |
|------|--------|-----|
| Display + UI | Space Grotesk | Geometric sans with personality; reads "serious software" not "system Helvetica"; pairs well with mono |
| Body narrative | Source Serif 4 | A serif inside a dark UI signals "this is text to read," not "this is chrome"; the contrast is the system |
| Stats / IDs / metadata | JetBrains Mono | Monospace for region IDs, status, panel titles — gives the site its "this is data" register |

## Mood references
- **Linear.app** — geometric sans + restrained accent + chrome panels
- **Vercel dashboard** — dark base + single amber/warm signal + monospace metadata
- **Foundry VTT** dashboards (the more recent ones) — TTRPG operations UI that doesn't look like 1998
- **Crusader Kings III** UI — strategy-game info-density without becoming spreadsheet
- **Arc Browser** — confident dark palette, single warm accent

## How it fixes red-on-black
Red is **demoted to map-marker status** — kept in the palette only for awnsheghlien tags, alert states, and Domain-Turn alarms. Primary visual signal is **amber `#d4a04a`** on charcoal `#1a1d24` (contrast ratio **8.4:1**, AAA pass). Amber reads warm and confident the way red reads aggressive and alarming. The hero's emphasis on *"a ruler"* uses amber with a soft block-highlight behind it — the same gesture as the current red caps, but in a colour that doesn't scream at the reader after the third sentence. Body text is `#e8e6e1` on `#1a1d24` = **12.3:1**, AAA.

## Audience match
**Where it shines:** the 5E onboarding cohort the audit's Jonas Brick called "the future of the fan base." The 25–40 demographic who play CK3, Foundry VTT, and use Linear at work. The audience that responds to *competence signals* — heartbeat status, live indicators, structured stats. Wins the *"oh, this site is run by people who know what they're doing"* judgement instantly.

**Where it loses:** the old-guard 1996 fans who read software-UI aesthetics as "this is not Forgotten Realms" — and who want a site that smells like leather, not Linear. The aesthetic also has to **actually back up its promise** — the heartbeat indicators and live status need to be real, or the design becomes a lie.

## Risks
- Promises an **interactive surface** (Domain Turn live, region feeds, stat strips). If the underlying site doesn't ship the Cassia Wren clickable-map / Bloodline Generator / Domain-Turn-live features, the design will look like a lie within two weeks
- The "operations console" framing is **less unique** than Direction A — there are 50 fintech and B2B SaaS dashboards that look like this. The differentiator has to come from content, not chrome
- Strategy-game aesthetic asks the audience to treat fantasy as systems-thinking. Some fans came to Birthright **for the romance**, not the systems
- Amber + charcoal is currently a saturated trend (Linear, Vercel, Arc); could read as 2024-dated by 2027 unless evolved

## What to test before committing
- WCAG AA on amber CTA (`#d4a04a` background, `#1a1410` text = **9.1:1**, AAA pass)
- The stat-strip and live indicators with **real** data wired in — does the system actually have something to display, or are we drawing fake meters?
- How a domain page (Tuornen) renders at full content density — does the stat-block discipline scale, or does every page need a custom layout?
- Mobile collapse of the stat-strip (currently 4-up → 2x2; verify on 360px)
- Whether old-guard fans read the chrome as "betrayed the setting" — sentiment test on the Discord
- How the amber holds up on commissioned illustration vs. on the current CSS-gradient placeholder
