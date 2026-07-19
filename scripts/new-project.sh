#!/usr/bin/env bash
# new-project.sh <slug> [title]
# Scaffold a new project folder under projects/<slug>/ with the canonical layout.
#
# Layout created:
#   projects/<slug>/
#   ├── _<slug>.md           entry point
#   ├── _tasks.md            Dataview task dashboard
#   ├── tasks/
#   │   ├── backlog/
#   │   ├── in-progress/
#   │   ├── blocked/
#   │   └── done/
#   └── templates/

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <slug> [title]" >&2
  echo "  slug  = kebab-case project name (e.g. my-project)" >&2
  echo "  title = display title (default: slug)" >&2
  exit 1
fi

SLUG="$1"
TITLE="${2:-$SLUG}"

# Resolve vault root: script lives in <vault>/scripts/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJ_DIR="$VAULT/projects/$SLUG"

if [[ -e "$PROJ_DIR" ]]; then
  echo "Error: $PROJ_DIR already exists." >&2
  exit 1
fi

# Validate slug: kebab-case, no spaces, no uppercase
if [[ ! "$SLUG" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Error: slug must be kebab-case (lowercase, hyphen-separated)." >&2
  exit 1
fi

TODAY="$(date +%Y-%m-%d)"

mkdir -p "$PROJ_DIR"/tasks/{backlog,in-progress,blocked,done}
mkdir -p "$PROJ_DIR/templates"

cat > "$PROJ_DIR/_${SLUG}.md" <<EOF
---
project: $SLUG
status: active
date: "$TODAY"
updated: "$TODAY"
tags:
  - project
---
# $TITLE

## Overview

## Status

## See Also
EOF

cat > "$PROJ_DIR/_tasks.md" <<'EOF'
---
date: "DATE_PLACEHOLDER"
updated: "DATE_PLACEHOLDER"
tags:
  - tasks
---
# Tasks

## In Progress
```dataview
TABLE WITHOUT ID file.link AS "Task", priority, epic
FROM "projects/SLUG_PLACEHOLDER/tasks/in-progress"
SORT priority ASC
```

## Backlog
```dataview
TABLE WITHOUT ID file.link AS "Task", priority, epic
FROM "projects/SLUG_PLACEHOLDER/tasks/backlog"
SORT priority ASC
```

## Blocked
```dataview
TABLE WITHOUT ID file.link AS "Task", priority, epic
FROM "projects/SLUG_PLACEHOLDER/tasks/blocked"
SORT priority ASC
```

## Done
```dataview
TABLE WITHOUT ID file.link AS "Task", updated
FROM "projects/SLUG_PLACEHOLDER/tasks/done"
SORT updated DESC
LIMIT 20
```
EOF

# Fill placeholders
sed -i '' "s/DATE_PLACEHOLDER/$TODAY/g; s/SLUG_PLACEHOLDER/$SLUG/g" "$PROJ_DIR/_tasks.md"

echo "Created: $PROJ_DIR"
echo "  _${SLUG}.md"
echo "  _tasks.md"
echo "  tasks/{backlog,in-progress,blocked,done}/"
echo "  templates/"
