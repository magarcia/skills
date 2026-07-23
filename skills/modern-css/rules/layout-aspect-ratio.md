---
title: Aspect Ratios
support: 93%
tags: layout, aspect-ratio, responsive
---

## Aspect Ratios

**Replaces:** Padding-top percentage with absolute positioning hack.

**Before:**

```css
.video-wrapper {
  position: relative;
  padding-top: 56.25%; /* 16:9 */
}
.video-wrapper > * {
  position: absolute;
  inset: 0;
}
```

**After:**

```css
.video-wrapper {
  aspect-ratio: 16 / 9;
}
```
