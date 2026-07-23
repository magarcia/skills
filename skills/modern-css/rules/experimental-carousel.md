---
title: Carousel Navigation with scroll-button/scroll-marker
support: 72%
tags: carousel, scroll-button, scroll-marker, experimental
---

## Carousel Navigation with scroll-button / scroll-marker

**Replaces:** Swiper.js or similar carousel libraries.

**Before:**

```js
new Swiper('.carousel', {
  navigation: { nextEl: '.next', prevEl: '.prev' },
  pagination: { el: '.dots' },
});
```

**After:**

```css
.carousel::scroll-button(right) {
  content: ">";
}
.carousel::scroll-button(left) {
  content: "<";
}
.carousel li::scroll-marker {
  content: "";
}
```

Pure CSS carousel with navigation buttons and dot indicators.
