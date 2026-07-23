---
title: Multiline Text Truncation with line-clamp
support: 96%
tags: typography, line-clamp, truncation, ellipsis
---

## Multiline Text Truncation with line-clamp

**Replaces:** JavaScript character counting with "..." addition.

**Before:**

```js
const text = element.textContent;
if (text.length > 100) {
  element.textContent = text.slice(0, 100) + '...';
}
```

**After:**

```css
.card-title {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
```
