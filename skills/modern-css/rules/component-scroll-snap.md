---
title: Scroll Snapping
support: 96%
tags: component, scroll-snap, carousel
---

## Scroll Snapping

**Replaces:** Slick, Swiper libraries with touch/scroll JavaScript handlers.

**Before:**

```js
new Swiper('.carousel', {
  slidesPerView: 1,
  spaceBetween: 16,
});
```

**After:**

```css
.carousel {
  display: flex;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  gap: 16px;
}
.carousel > * {
  scroll-snap-align: start;
  flex-shrink: 0;
}
```

Native scroll behavior with momentum, touch support, and accessibility built-in.
