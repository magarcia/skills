---
title: Dialog Light Dismiss with closedby
support: 72%
tags: component, dialog, closedby, light-dismiss
---

## Dialog Light Dismiss with closedby

**Replaces:** JavaScript click-outside listeners on backdrop.

**Before:**

```js
dialog.addEventListener('click', e => {
  if (e.target === dialog) dialog.close();
});
```

**After:**

```html
<dialog closedby="any">Click outside to close</dialog>
```

Values: `any` (click outside + ESC), `closerequest` (ESC only), `none` (explicit close only).
