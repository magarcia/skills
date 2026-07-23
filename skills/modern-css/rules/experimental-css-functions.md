---
title: Reusable CSS Logic with @function
support: 67%
tags: function, reusable, logic, experimental
---

## Reusable CSS Logic with @function

**Replaces:** Sass `@function` mixins.

**Before (Sass):**

```scss
@function fluid($min, $max) {
  @return clamp(#{$min}, #{$min} + ($max - $min) * (100vw - 320px) / (1200 - 320), #{$max});
}
h1 { font-size: fluid(1rem, 3rem); }
```

**After (native CSS):**

```css
@function --fluid(--min, --max) {
  @return clamp(var(--min), /* fluid calc */, var(--max));
}
h1 { font-size: --fluid(1rem, 3rem); }
```

Native CSS functions — no build step needed.
