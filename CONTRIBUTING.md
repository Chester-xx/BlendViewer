# Contributing to BlendViewer

Thanks for your interest in contributing! This is a young, actively-changing project, so please open an issue before starting large changes.

## Setup

After cloning, activate the versioned git hooks so commit messages auto-load the template:

```
git config core.hooksPath .githooks
```

On macOS/Linux you may also need:
```
chmod +x .githooks/prepare-commit-msg
```

## Branch naming

Use a short prefix that describes the type of change:

```
feat/short-description
fix/short-description
chore/short-description
docs/short-description
refactor/short-description
```

## Commit messages

This repo follows [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<optional scope>): <short summary>

[optional body]

[optional footer, e.g. Closes #12]
```

Common types: `feat`, `fix`, `chore`, `docs`, `refactor`, `style`, `perf`, `test`, `build`.

Examples:
```
feat(sidebar): add environment loading progress bar
fix(viewport): correct anchor binding on resize
chore(deps): bump Qt to 6.10.2 in CMakePresets
```

This keeps history readable and will let us auto-generate changelogs once the project starts tagging releases.

## Building locally

See the README's Project Setup section. In short:

```
cmake --preset debug
cmake --build --preset debug
```

## Pull requests

- Keep PRs focused — one feature/fix per PR
- Fill out the PR template checklist
- Link the issue it resolves
- Include screenshots for any UI-visible change (this is a visual app, they help a lot in review)

## Code style

- Match the existing QML formatting conventions in this repo (see any `ui/` file for reference: tab indentation inside components, `// - Component` closing comments, grouped `anchors { }` blocks)
- Keep new QML files scoped to a single component where possible, mirroring the existing sidebar/statusbar/viewport module structure
