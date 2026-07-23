---
title: Low-Specificity Resets with :where()
support: 96%
tags: selector, where, specificity, reset
---

## Low-Specificity Resets with :where()

**Replaces:** Complex selectors with (0,0,1) specificity battles.

**Before:**

```css
ul, ol {
  margin: 0; /* specificity: (0,0,1) — hard to override cleanly */
}
```

**After:**

```css
:where(ul, ol) {
  margin: 0;
  padding-inline-start: 1.5rem;
}
```

`:where()` has zero specificity — any selector overrides it. Ideal for base styles and resets.
