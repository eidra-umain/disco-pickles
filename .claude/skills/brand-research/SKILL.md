---
name: brand-research
description: >
  Research a brand's visual language and identity by analyzing their website, social media, and app
  store presence. Produces a structured brand report with colors, typography, imagery style, tone of
  voice, and design patterns that can inform future app or product design. Use this skill whenever
  the user asks to "research a brand", "analyze brand visuals", "get the look and feel of [company]",
  "what does [brand] look like", "collect brand assets", "study the visual identity", "brand audit",
  or any request that involves understanding a brand's design language before starting design work.
  Also trigger when the user mentions needing "brand guidelines", "visual direction", "style reference",
  or "design inspiration" from an existing brand. Even if the user just says something like "look at
  how Libresse presents themselves" — that's this skill.
---

# Brand Visual Language Research

## Purpose

Before designing anything, you need to understand the brand you're designing for. This skill
systematically analyzes a brand's visual presence across their website, social media, and app store
listings to extract a structured understanding of their design language. The output is a brand
report that a designer can use as a foundation for app design, wireframes, or visual specs.

## Why this matters

Designers often start from a brief that says things like "align with the brand" without specifying
what that means concretely. This skill bridges that gap by going to the source — the brand's own
public presence — and extracting the actual visual patterns they use. Colors, not described in a
brief, but observed from their live site. Typography choices visible in their headers and body text.
The mood of their photography. The tone of their copy. These details are what make a prototype feel
"on brand" vs. generic.

## Inputs

The skill needs one of:
- A **brand name** (e.g., "Libresse", "Spotify", "Aesop")
- A **URL** to the brand's website
- A **brief or document** that mentions the brand (the skill will extract the brand name)

If only a brand name is given, search for their official website, main social accounts, and app
store listings.

## Output

Write a brand report to **`design/brand-research-[brand-name].md`** (lowercase, hyphenated).

## Workflow

### Step 1: Identify the brand's digital footprint

Start by searching for the brand to find their key digital properties:

1. **Official website** — the primary source. Find the main URL.
2. **Social media** — look for Instagram, TikTok, or other visual-heavy platforms. Instagram is
   the most useful for visual language since brands curate their visual identity there carefully.
3. **App store** — if the brand has an app, check the App Store / Google Play listing for
   screenshots, description tone, and icon design.

Use web search to find these. Note: you may not be able to access all of them due to network
restrictions. Work with what you can reach — a partial picture is still valuable.

### Step 2: Analyze the website

Use Chrome browser tools to visit and analyze the brand's website. This is your richest source.

**Navigate to the site** and take screenshots of:
- Homepage (above the fold and below)
- A product page or key interior page
- The navigation / header area
- Footer

**Extract from each page:**

#### Colors
Look at the page systematically:
- **Primary brand color** — what's the dominant color in headers, CTAs, accents?
- **Secondary colors** — what fills backgrounds, cards, supporting elements?
- **Neutral palette** — what grays/whites/blacks do they use for text and backgrounds?
- **Accent/highlight colors** — used sparingly for emphasis

Use JavaScript via the Chrome MCP tools to extract computed styles from key elements if possible:
```javascript
// Example: extract background and text colors from the hero section
const hero = document.querySelector('[class*="hero"], main > section:first-child, header');
if (hero) {
  const style = getComputedStyle(hero);
  JSON.stringify({
    background: style.backgroundColor,
    color: style.color
  });
}
```

Also try extracting CSS custom properties (design tokens) from :root:
```javascript
const rootStyles = getComputedStyle(document.documentElement);
const props = ['--color-primary', '--color-secondary', '--brand-color', '--accent',
               '--text-color', '--bg-color', '--font-family', '--font-size-base'];
const tokens = {};
props.forEach(p => {
  const val = rootStyles.getPropertyValue(p).trim();
  if (val) tokens[p] = val;
});
JSON.stringify(tokens);
```

#### Typography
- **Heading font** — family, weight, approximate size
- **Body font** — family, weight, size, line-height
- **How many typefaces** do they use? Most good brands use 1-2.
- **Text styling patterns** — all caps for labels? Italic for quotes? Letter spacing?

Extract fonts programmatically:
```javascript
const headings = document.querySelectorAll('h1, h2, h3');
const body = document.querySelector('p');
const fonts = {};
if (headings.length) {
  const s = getComputedStyle(headings[0]);
  fonts.heading = { family: s.fontFamily, weight: s.fontWeight, size: s.fontSize };
}
if (body) {
  const s = getComputedStyle(body);
  fonts.body = { family: s.fontFamily, weight: s.fontWeight, size: s.fontSize, lineHeight: s.lineHeight };
}
JSON.stringify(fonts);
```

#### Imagery style
From screenshots, describe:
- **Photography style** — studio/lifestyle/editorial? Bright/moody/muted? Close-up/environmental?
- **Subject matter** — people, products, abstract, nature?
- **Color treatment** — saturated/desaturated? Warm/cool? Filtered?
- **Illustration style** (if present) — flat/3D? Geometric/organic? What color palette?

#### Layout patterns
- **Grid structure** — how wide is the content? How many columns?
- **Whitespace** — generous/tight? How much breathing room?
- **Card patterns** — rounded corners? Shadows? Borders?
- **Button styles** — rounded/square? Filled/outlined? Size?
- **Navigation style** — minimal/complex? Sticky? Transparent?

#### Tone of voice
- Read headline copy and body text on 2-3 pages
- **Formal or casual?** — "Discover our collection" vs. "Check this out"
- **Technical or accessible?** — jargon level
- **Emotional register** — empowering, calming, playful, luxurious, clinical?
- **Sentence length** — short and punchy or flowing and descriptive?

### Step 3: Analyze social media presence

If you can access the brand's Instagram or other social accounts:
- Take a screenshot of their profile/grid
- Note the **visual consistency** — is there a clear aesthetic?
- **Color palette in posts** — does it match the website?
- **Content mix** — product shots, lifestyle, user-generated, educational?
- **Caption tone** — how does it compare to website copy?

If you can't access social directly, search for recent coverage or analysis of their social presence.

### Step 4: Check app store presence (if applicable)

If the brand has a mobile app:
- Look at the **app icon** design
- **Screenshot style** in the store listing
- **App description tone**
- Note any differences from the website's visual language

### Step 5: Compile the brand report

Write the report using the template below. Be specific — cite actual hex values, font names, and
pixel sizes where you found them. Include observations, not just data. A designer reading this
should understand the "why" behind the brand's visual choices, not just the "what."

## Report Template

Use this structure for the output file:

```markdown
# Brand Research: [Brand Name]

**Date:** [date]
**Sources analyzed:** [list URLs visited]
**Researcher:** AI-assisted brand analysis

---

## Executive Summary

[2-3 sentences capturing the brand's overall visual identity and design philosophy.
What's the first impression? What feeling does the brand communicate?]

---

## Color Palette

### Primary Colors
| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Primary | [name] | #XXXXXX | [where it's used] |
| Secondary | [name] | #XXXXXX | [where it's used] |

### Neutral Colors
| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Background | [name] | #XXXXXX | [where] |
| Text | [name] | #XXXXXX | [where] |
| Border/Divider | [name] | #XXXXXX | [where] |

### Accent Colors
[Any highlight, CTA, or special-purpose colors]

### Color Observations
[What mood does the palette create? Is it warm/cool? Bold/subdued?
How does color usage differ between website and social?]

---

## Typography

### Typefaces
| Context | Font Family | Weight | Size | Notes |
|---------|-------------|--------|------|-------|
| Headings | [family] | [weight] | [size] | [observations] |
| Body | [family] | [weight] | [size] | [line-height, letter-spacing] |
| Labels/UI | [family] | [weight] | [size] | [caps, tracking] |

### Typography Observations
[How does the typography contribute to the brand feel? Is it modern/classic?
Warm/technical? How does hierarchy work?]

---

## Imagery & Visual Style

### Photography
- **Style:** [studio/lifestyle/editorial/documentary]
- **Lighting:** [bright/moody/natural/dramatic]
- **Color treatment:** [saturated/muted/warm/cool]
- **Subjects:** [people/products/scenes/abstract]
- **Composition:** [close-up/wide/environmental]

### Illustrations (if present)
- **Style:** [flat/3D/hand-drawn/geometric]
- **Color palette:** [matches brand colors / distinct palette]
- **Usage:** [where illustrations appear and what role they play]

### Iconography
- **Style:** [outline/filled/rounded/sharp]
- **Weight:** [thin/regular/bold]
- **Consistency:** [are icons from a system or custom?]

---

## Layout & Components

### Spacing & Grid
- **Content width:** [approximate max-width]
- **Whitespace philosophy:** [generous/moderate/tight]
- **Vertical rhythm:** [spacing between sections]

### Component Patterns
- **Buttons:** [style, corner radius, sizes]
- **Cards:** [borders, shadows, corner radius]
- **Navigation:** [style, behavior]
- **Forms/inputs:** [style if visible]

---

## Tone of Voice

- **Register:** [formal/casual/conversational]
- **Personality:** [3-4 adjectives, e.g., "warm, empowering, body-positive"]
- **Copy style:** [sentence length, punctuation style, capitalization]
- **Key phrases:** [recurring words or phrases that define the brand voice]

---

## Platform Comparison

| Aspect | Website | Social Media | App Store |
|--------|---------|-------------|-----------|
| Color emphasis | | | |
| Photography style | | | |
| Tone of voice | | | |
| Notable differences | | | |

---

## Design Implications

[3-5 actionable takeaways for the design team. What should we carry forward
into the app design? What visual principles should guide the work? What to
avoid? This section bridges research → design.]

---

## Raw Assets & References

[List any specific assets found: logo variants, color codes, font names,
pattern libraries, or brand guideline documents if publicly available.
Include URLs where relevant.]
```

## Tips for better results

- **Be a detective, not a scanner.** Don't just list what you see — interpret it. Why did they
  choose that shade of green? What does the typography spacing communicate?
- **Compare across platforms.** Brands often present slightly differently on Instagram vs. their
  website. Note the differences — they reveal priorities.
- **Look at what's absent.** If a brand never uses gradients, or never shows faces, or avoids
  certain colors — that's as informative as what they do use.
- **Prioritize what's useful for design.** A designer needs concrete values (hex codes, font names,
  border radii) alongside the mood and philosophy. Give both.
