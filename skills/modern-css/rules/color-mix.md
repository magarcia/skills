---
title: Color Mixing with color-mix()
support: 89%
tags: color, mix, blend
---

## Color Mixing with color-mix()

**Replaces:** Sass `mix($blue, $pink, 60%)` function.

**Before:**

```scss
background: mix($blue, $pink, 60%);
```

**After:**

```css
background: color-mix(in oklch, #3b82f6, #ec4899);
```

Defaults to 50/50 mix. Specify percentages: `color-mix(in oklch, #3b82f6 70%, #ec4899)`. Use `in oklch` for perceptually uniform blending.
