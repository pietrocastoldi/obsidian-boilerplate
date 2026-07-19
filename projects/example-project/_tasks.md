---
date: "2026-07-18"
updated: "2026-07-18"
tags:
  - tasks
---
# Tasks

## In Progress
```dataview
TABLE WITHOUT ID file.link AS "Task", priority, epic
FROM "projects/example-project/tasks/in-progress"
SORT priority ASC
```

## Backlog
```dataview
TABLE WITHOUT ID file.link AS "Task", priority, epic
FROM "projects/example-project/tasks/backlog"
SORT priority ASC
```

## Blocked
```dataview
TABLE WITHOUT ID file.link AS "Task", priority, epic
FROM "projects/example-project/tasks/blocked"
SORT priority ASC
```

## Done
```dataview
TABLE WITHOUT ID file.link AS "Task", updated
FROM "projects/example-project/tasks/done"
SORT updated DESC
LIMIT 20
```
