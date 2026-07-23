---
title: Auto-Growing Textarea with field-sizing
support: 73%
tags: form, field-sizing, textarea, experimental
---

## Auto-Growing Textarea with field-sizing

**Replaces:** JavaScript measuring `scrollHeight` on input events.

**Before:**

```js
textarea.addEventListener('input', () => {
  textarea.style.height = 'auto';
  textarea.style.height = textarea.scrollHeight + 'px';
});
```

**After:**

```css
textarea {
  field-sizing: content;
  min-height: 3lh;
}
```

Textarea grows automatically with content. `lh` unit = line height.
