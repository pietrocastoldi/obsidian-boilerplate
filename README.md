# Obsidian Vault Boilerplate

A reusable starting structure for a personal/professional Obsidian vault built around three ideas:

1. **Templates define the ontology**: every note type (project, task, article) has a template that defines its frontmatter and sections, so the templates are the single source of truth for what each entity looks like.
2. **Folders as state**: task status is the folder the file sits in (`tasks/in-progress/`, `tasks/done/`), no status fields to keep in sync.
3. **Dashboards via Dataview**: each project's `_tasks.md` is an auto-generated view over frontmatter.

## Getting started

1. Copy this folder and open it as a vault in Obsidian.
2. Enable community plugins and install **Dataview**, **Meta Bind**, and **Pixel Banner** from the community plugin browser. Their settings are pre-configured in `.obsidian/plugins/`, only the plugin code needs installing.
3. Enable the Obsidian CLI: in the Obsidian app, go to Settings → General and install the command line interface, then run `obsidian vault list` in a terminal to confirm it sees the vault. The conventions rely on `obsidian move`/`rename` to keep wikilinks intact.
4. Create your first project: `bash scripts/new-project.sh my-project "My Project"`.
5. Read `CLAUDE.md` for conventions. It doubles as instructions for AI assistants (Claude Code and similar) working in the vault.

## Layout

```
projects/
  example-project/  scaffolded example (delete or rename)
reference/articles/ captured articles + template
scripts/            new-project.sh scaffolder
```
