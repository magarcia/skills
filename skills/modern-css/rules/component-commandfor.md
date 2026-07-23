---
title: Modal Controls with commandfor
support: 72%
tags: component, dialog, commandfor, declarative
---

## Modal Controls with commandfor

**Replaces:** onclick handlers with querySelector and showModal().

**Before:**

```js
document.querySelector('.open-btn').addEventListener('click', () => {
  document.querySelector('#dlg').showModal();
});
```

**After:**

```html
<button commandfor="dlg" command="show-modal">Open</button>
<dialog id="dlg">
  <p>Content</p>
  <button commandfor="dlg" command="close">Close</button>
</dialog>
```

Declarative — no JavaScript needed to wire up dialog open/close.
