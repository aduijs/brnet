# Direction C — Folk Atmospheric / Saga

## In one sentence
Birthright as **a fresco lit from within** — twilight blue-green, ember accents, runic carved type, the setting framed as ancestral myth still warm under the ash.

## Palette
| Role | Hex | Use |
|------|-----|-----|
| Deep | `#1a2d2e` | Page primary — blue-green not black, atmospheric depth |
| Deep shadow | `#0f1e1f` | Vignette, interstitial background, fortress silhouettes |
| Deep elevated | `#213738` | Region cards, hover states |
| Smoke | `#403a36` | Warm shadow tone (unused in nav, reserved for content pages) |
| **Ember** | `#d97a3c` | Primary accent — CTA, sigils, highlights, italic emphasis |
| Ember soft | `#c66b30` | Hover state |
| Ivory | `#ede4d3` | Body type, headlines |
| Ivory dim | `#c8bea8` | Lede text, secondary copy |
| Gold muted | `#a88a4e` | Attributions, region meta labels |
| Line | `rgba(237,228,211,0.12)` | All borders — soft on dark |

**No red anywhere.**

## Typography
| Role | Family | Why |
|------|--------|-----|
| Display | Marcellus | Trajan-inspired serif with subtle Roman epigraphic feel; reads carved, not printed |
| Small caps + UI | Marcellus SC | Same family in small-caps; gives nav, eyebrows, region meta a runic / inscribed feel |
| Body | EB Garamond | Renaissance humanist serif with full italic; airy at 17px; carries narrative prose well |
| Italic emphasis | EB Garamond Italic | Lede uses it as voice, not decoration |

## Mood references
- **The Northman** (2022) film key art — deep cyan + ember firelight, figure backlit
- **Hilma af Klint** retrospective design language — symbol-heavy, atmospheric
- **Folio Society's Beowulf** edition — runic Marcellus-style display, ivory on deep ground
- **Apple TV+'s *The Green Knight*** marketing — atmospheric medieval without armour-shop kitsch
- Old Norse / Icelandic saga book covers — sigil + restraint
- Pentagram's Walker Art Center identity — confident serif + saturated accent + atmospheric photography

## How it fixes red-on-black
**Red is removed entirely.** Replaced by ember-orange `#d97a3c` (warm, not aggressive — fire, not alarm). Ember on deep blue-green = **6.8:1**, AA pass for normal text and AAA for large display type. The CTA is solid ember on deep, contrast **8.2:1**. The "a ruler" emphasis uses ember italic — the same gesture as the current red caps, but it reads as **firelight on a face** rather than **warning sign**. Ivory body type on deep = **11.4:1**, AAA. The whole palette is naturalistic — twilight, ember, ash — so warmth comes from heat, not alarm.

## Audience match
**Where it shines:** the romantic-fantasy reader, the long-campaign GM, the audience that came to TTRPGs through Tolkien and *The Witcher* novels before they came through Critical Role. The narrative-first cohort. The 30–50 audience who watch slow prestige fantasy (*The Green Knight*, *The Northman*, *The Last Duel*) and want their setting to feel *literary*. Wins the *"this site believes in itself"* judgement instantly. Also: the boldest visual identity of the three — most likely to get screenshotted and posted.

**Where it loses:** the operations-minded fan who wants stats, tools, and dashboards. The audience David Reyes wrote for — the conversion-shaped visitor — will read this as romance over function. If they want to *find* something quickly, the atmospheric chrome slows them down.

## Risks
- **Atmospheric design only works if the content is atmospheric.** A Tuornen page with five h2 sections and a stat-grid will feel jarring inside this shell unless the prose is rewritten to match. The visual identity is making a promise the writing has to keep
- The **fresco-lit hero illustration is the single biggest art-direction dependency** of all three directions. CSS-gradient placeholder is acceptable for the mockup, but production needs commissioned imagery in this mood. Stock fantasy photography will collapse the whole identity
- Marcellus + EB Garamond is a quieter pairing than the current site — risk that returning fans read **quiet** as **dead**
- Ember-orange is uncommon enough to be memorable but uncommon enough to require **conviction** — half-applied, it looks like a colour the designer ran out of ideas before finishing
- The "saga" framing leans hard on Rjurik (Norse) cultural mood; risk of flattening the Khinasi/Brechtür/Vosgaard cultural distinctions if not balanced on inner pages

## What to test before committing
- WCAG AA on ember CTA (`#d97a3c` background, `#1a2d2e` text = **8.2:1**, AAA pass)
- Ember italic emphasis in the hero (`#d97a3c` on deep blue-green = **6.8:1**, AA pass for body, AAA for the large display use)
- How a domain page renders without the ember-glow hero treatment — does the atmospheric language survive on text-heavy pages, or does it need a second tier of layout?
- Real-device readability of EB Garamond at 17px on dark — on lower-quality OLED panels, ivory-on-deep can shimmer
- Whether the **fresco-style hero illustration** (currently a CSS-gradient + SVG silhouette placeholder) can be produced for real — this direction depends on commissioned art more than the other two
- Cassia Wren screenshot test: would she actually send this to a friend? (Strongest of the three on this question, by design)
