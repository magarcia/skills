---
title: Inline Conditional Styles with if()
support: 35%
tags: conditional, if, style-query, experimental
---

## Inline Conditional Styles with if()

**Replaces:** JavaScript classList.toggle operations.

**Before:**

```js
btn.classList.toggle('primary', variant === 'primary');
```

**After:**

```css
.btn {
  background: if(style(--variant: primary): blue; else: gray);
}
```

Conditional styling based on custom property values, inline.
