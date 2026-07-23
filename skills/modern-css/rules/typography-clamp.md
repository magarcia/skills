---
title: Fluid Typography with clamp()
support: 95%
tags: typography, fluid, responsive, clamp
---

## Fluid Typography with clamp()

**Replaces:** Media query breakpoint ladder.

**Before:**

```css
h1 { font-size: 1.5rem; }
@media (min-width: 768px) { h1 { font-size: 2rem; } }
@media (min-width: 1200px) { h1 { font-size: 3rem; } }
```

**After:**

```css
h1 {
  font-size: clamp(1.5rem, 2.5vw + 1rem, 3rem);
}
```

`clamp(minimum, preferred, maximum)` — scales fluidly between min and max based on viewport. Works for spacing, widths, and any length value.
