---
title: Sticky/Snapped Element Styling with scroll-state()
support: 50%
tags: scroll, scroll-state, sticky, experimental
---

## Sticky/Snapped Element Styling with scroll-state()

**Replaces:** Scroll event listeners checking element position.

**Before:**

```js
window.addEventListener('scroll', () => {
  const rect = header.getBoundingClientRect();
  header.classList.toggle('stuck', rect.top <= 0);
});
```

**After:**

```css
@container scroll-state(stuck: top) {
  .header {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
}
```

Style elements based on their scroll-related state (stuck, snapped, scrollable).
