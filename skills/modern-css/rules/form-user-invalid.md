---
title: Form Validation with :user-invalid
support: 85%
tags: form, validation, user-invalid, user-valid
---

## Form Validation with :user-invalid / :user-valid

**Replaces:** JavaScript blur event listeners adding a "touched" class.

**Before:**

```js
input.addEventListener('blur', () => input.classList.add('touched'));
```

```css
input.touched:invalid { border-color: red; }
input.touched:valid { border-color: green; }
```

**After:**

```css
input:user-invalid {
  border-color: red;
}
input:user-valid {
  border-color: green;
}
```

Only triggers after user interaction — no error states shown on page load.
