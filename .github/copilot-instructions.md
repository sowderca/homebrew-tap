# Copilot instructions for `sowderca/homebrew-tap`

## Build, test, and lint commands

This repository is a Homebrew tap and is validated with Homebrew's `test-bot` workflow commands.

- Full local validation flow:
  - `brew test-bot --only-cleanup-before`
  - `brew test-bot --only-setup`
  - `brew test-bot --only-tap-syntax`
  - `brew test-bot --only-formulae`
- Fast syntax/lint check for tap files:
  - `brew test-bot --only-tap-syntax`
- Formula test pass (the closest equivalent to running a focused test stage):
  - `brew test-bot --only-formulae`

## High-level architecture

- This repo is a standard Homebrew tap for `sowderca/tap`.
- `Formula/` is where formula Ruby files belong.
- `Casks/` is where cask Ruby files belong.
- CI uses a `brew test-bot` workflow across macOS (Intel + ARM generation runner) and Linux container, and runs formula checks for pull requests.
- Publishing bottles is handled via the `brew pr-pull` workflow, which pulls bottle artifacts for a PR and pushes the resulting commits to `main`.

## Key repository conventions

- Keep Homebrew-specific validation as the source of truth: prefer `brew test-bot` stages over ad-hoc custom scripts.
- Align changes with PR-driven flow: formula verification happens in PRs (`--only-formulae`), then bottle publishing is completed via the `pr-pull` workflow.
- Use Homebrew tap layout conventions strictly (`Formula/*.rb`, `Casks/*.rb`) so CI stages discover files correctly.
