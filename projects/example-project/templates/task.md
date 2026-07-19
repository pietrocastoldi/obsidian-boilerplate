---
priority: 5
points: 
date: "{{date}}"
updated: "{{date}}"
epic: ""
resolution_date: 
---

**Priority:** `INPUT[number:priority]`

**Points:** `INPUT[number:points]`

**Epic:** `INPUT[inlineSelect(option(epic-a), option(epic-b), option(tech-debt)):epic]`

**Added:** `INPUT[date:date]`

**Updated:** `INPUT[date:updated]`

**Resolution date:** `INPUT[date:resolution_date]` (set when task moves to done)

---
