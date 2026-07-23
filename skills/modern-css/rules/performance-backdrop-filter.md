---
title: Frosted Glass with backdrop-filter
support: 96%
tags: performance, backdrop-filter, blur, glass
---

## Frosted Glass with backdrop-filter

**Replaces:** Pseudo-element background blur workarounds.

**Before:**

```css
.glass {
  position: relative;
}
.glass::before {
  content: '';
  position: absolute;
  inset: 0;
  background: inherit;
  filter: blur(12px);
  z-index: -1;
}
```

**After:**

```css
.glass {
  backdrop-filter: blur(12px);
  background: rgba(255, 255, 255, 0.1);
}
```
