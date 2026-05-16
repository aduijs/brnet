# Direction A — Heritage / Sigil & Vellum

## In one sentence
Birthright as **a manuscript preserved by stewards** — light parchment, ink type, heraldic accents used as punctuation, the setting framed as a museum exhibit you are trusted to walk through.

## Palette
| Role | Hex | Use |
|------|-----|-----|
| Parchment (page) | `#f4ecd8` | Page primary, hero, nav background |
| Parchment deep | `#ebe0c4` | Hover states, framed insets, sections |
| Ink | `#1a1815` | Body type, primary button fill, brand mark |
| Ink soft | `#3a342c` | Nav links, secondary body type |
| Ink muted | `#6b5f4c` | Captions, italic asides, figcaption |
| Heraldic gules | `#a3232b` | Drop-cap, eyebrow lines, sigil fill, hover accent |
| Heraldic azure | `#1c3a5e` | Rjurik crest, regional accent only |
| Heraldic or | `#c8a449` | Gold rule on lede, band-text highlight |
| Heraldic vert | `#3d5e3a` | Brechtür crest, regional accent only |

## Typography
| Role | Family | Why |
|------|--------|-----|
| Display | Cinzel | Carved-stone serif, all-caps Roman epigraphic tradition; reads "considered" not "Kickstarter" |
| Body display | Cormorant Garamond | Renaissance humanist serif with italic that carries voice; high contrast strokes work on parchment |
| Body sans | Source Sans 3 | Humanist sans for nav and small UI; legible at 11px caps without feeling system-default |
| Italic asides | Cormorant Garamond Italic | The lede + figcaptions read as marginalia, not body copy |

## Mood references
- The British Library exhibition pages — typography first, ornament restrained
- Folio Society book covers — confident serif on textured stock, sparing colour
- Pentagram's *The Atlantic* redesign for editorial gravitas
- Medieval manuscript facsimile editions (Trinity Apocalypse, Beatus of Liébana) for the figcap-as-attribution gesture

## How it fixes red-on-black
The page is **light**, not dark. Red is no longer fighting body type for the visitor's attention because red is no longer doing typographic work — it is doing **heraldic** work. The gules `#a3232b` is reserved for the drop-cap, the italic emphasis on "a ruler," the sigil fill, and one accent rule. Body type is ink-on-paper at WCAG AAA contrast (≈ 14:1). The hero illustration is moved into a framed inset and de-saturated to sepia, so it stops competing with the type for hierarchy. The result: red signals **inheritance**, not **alarm**.

## Audience match
**Where it shines:** the returning fan who has read AD&D second-edition supplements bound in faux-leather and remembers when fantasy was allowed to look serious. The 35–55 cohort. Critics, writers, GMs who run long campaigns. The Folio-Society / Criterion-Collection demographic. Wins the *"this site was made by an adult"* judgement instantly.

**Where it loses:** TikTok-native discovery. The under-25 cohort scrolling reels will read it as "old." The aesthetic asks the visitor to slow down, and cold traffic from social does not slow down.

## Risks
- Could read as **stuffy** to the 5E onboarding cohort the audit's Jonas Brick flagged as the future of the fan base
- Parchment palette is unusual enough that it will be remembered, but **scaling it to 30+ domain pages** requires real art direction (heraldic crest library, consistent figure treatment) or it collapses into pastiche
- Light mode reverses 95% of TTRPG community-site convention; some fans will read "light = casual" before they read "light = considered"
- Without commissioned illustration, the framed sepia inset will look like a placeholder rather than a museum object

## What to test before committing
- WCAG AA contrast on body text on parchment (currently `#1a1815` on `#f4ecd8` = **15.8:1**, AAA pass)
- Hero display contrast (Cormorant Garamond `#1a1815` on parchment = AAA pass; gules `#a3232b` on parchment = **6.4:1**, AA pass for large text)
- How a sample domain page (Tuornen) renders in this system once it has real text density — pages with five h2 sections and a stat-block grid need to **breathe** in this palette or it gets visually busy
- Mobile readability of the drop-cap construction under 380px width
- Whether the heraldic crest grid can scale to 50 domains without becoming visual wallpaper
