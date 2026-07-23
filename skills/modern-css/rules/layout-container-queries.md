---
title: Responsive Components with @container
support: 93%
tags: layout, container-queries, responsive, components
---

## Responsive Components with @container

**Replaces:** Viewport-based `@media` queries for component layout.

**Before:**

```css
@media (max-width: 400px) {
  .card {
    flex-direction: column;
  }
}
```

**After:**

```css
.card-wrapper {
  container-type: inline-size;
}

@container (width < 400px) {
  .card {
    flex-direction: column;
  }
}
```

Components respond to their container's size rather than the viewport, making them truly reusable across different layout contexts.
