---
title: Specificity Control with @layer
support: 95%
tags: selector, layers, specificity, cascade
---

## Specificity Control with @layer

**Replaces:** `!important` escalation arms race.

**Before:**

```css
.btn { background: gray; }
.btn.primary { background: blue; }
.utility .btn { background: red !important; } /* escalation */
```

**After:**

```css
@layer base, components, utilities;

@layer base {
  .btn { background: gray; }
}
@layer components {
  .btn { background: blue; }
}
@layer utilities {
  .mt-4 { margin-top: 1rem; }
}
```

Later layers always win regardless of selector specificity. Unlayered styles beat all layers.
