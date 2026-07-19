# Vault Guide

Lean guide for working in this vault (for humans and AI assistants). Structural rules (frontmatter fields, section layout) live in **templates**, not here.

## Structure

- `projects/<slug>/` one folder per project: entry point `_<slug>.md`, task dashboard `_tasks.md`, `tasks/`, `templates/`
- `reference/articles/` captured articles
- `scripts/new-project.sh <slug> [title]` scaffolds a new project folder

## Templates (how to create notes)

Templates are the source of truth for frontmatter and section layout. When creating a note, copy the matching template first:

| Template | Purpose |
|---|---|
| `projects/<slug>/templates/task.md` | Task (priority, epic) |
| `reference/articles/templates/article.md` | Article capture |

If a template has fields the user did not specify, ask for each missing field before writing. No invented defaults.

## Conventions

- **Filenames**: kebab-case.
- **Entry points**: prefix `_` so they sort first (`_tasks.md`, `_<slug>.md`).
- **Wikilinks**: link every named entity (project, article, topic) that has its own note.
- **Logs**: reverse-chronological, newest first, always prepend. Log events, not administration (status flips, renames); administrative changes go in frontmatter.
- **Task status = folder**: tasks live under `projects/<slug>/tasks/{backlog, in-progress, blocked, done}/`. Change status by moving the file. No `status:` field on tasks.
- **Closing a task**: move to `tasks/done/`, set `resolution_date`, bump `updated`.
- **`updated:`**: bump when meaning changes, not for renames or typo fixes.
- **`## See Also`**: only link notes directly related by topic. When unsure, omit.

## Plugins

- **Dataview**: powers the per-project `_tasks.md` dashboards.
- **Meta Bind**: inline `INPUT[...]` fields in task notes.
- **Pexels Banner**: optional note banners via the `banner` frontmatter field.

## Obsidian CLI

Use `obsidian move`/`rename` instead of `mv` for moving or renaming notes: they rewrite wikilinks, `mv` leaves dangling links.
