# Changelog

This file records notable changes to this repository: both updates that track a
new version of a demonstrated library, and other maintenance (repository
tooling, conventions, restructuring) worth a checkpoint.

## Versioning convention

- Each entry below corresponds to a git tag named after the date the change was
  merged (`vYYYY-MM-DD`), e.g. [`v2026-07-08`](https://github.com/Astroshaper/Astroshaper-examples/tree/v2026-07-08).
- This repository is not a registered Julia package, so tags are not Semantic
  Versioning — they are just checkpoints you can check out to see the repository
  as it was at a notable point in time (a library-version migration or other
  maintenance work).
- The authoritative source for "which library version does this example target
  right now" is each example's own `Project.toml` `[compat]` entry, tracked in
  git history for that path.

## v2026-07-09

### Repository tooling: CHANGELOG, AGENTS.md, tag/release convention

- Added this `CHANGELOG.md` as the append-only record of notable repository
  changes, and folded the old top-level README `## Compatibility` section
  into a `Compatible with: ...` line per example.
- Added `AGENTS.md` documenting repository conventions for AI coding agents
  (layout, the frozen `TPM_Kanamaru2021` example, the shared `plot_shape.jl`
  dependency gotcha, the migration checklist, verification steps, and git
  workflow).
- Settled on `vYYYY-MM-DD` as the tag-naming convention for these checkpoints
  (previously bare `YYYY-MM-DD`), and fixed the legacy v0.0.6→v0.0.7 entry
  below to use its actual tag name (`v0.0.7-compatible`) as its heading.
- Commits: PR [#19](https://github.com/Astroshaper/Astroshaper-examples/pull/19),
  PR [#20](https://github.com/Astroshaper/Astroshaper-examples/pull/20),
  PR [#21](https://github.com/Astroshaper/Astroshaper-examples/pull/21)
- Tag: [`v2026-07-09`](https://github.com/Astroshaper/Astroshaper-examples/tree/v2026-07-09)

## v2026-07-08

### AsteroidThermoPhysicalModels.jl: v0.0.7 → v0.2.1

- Migrated `TPM_Ryugu` and `TPM_Didymos` to the v0.2.1 Problem/Solver API
  (`SingleAsteroidThermoPhysicalProblem`, `solve`/`CrankNicolson`,
  `SingleAsteroidOutputSpec`, `export_solution`), and moved shape loading to
  `AsteroidShapeModels.jl`.
- Commit: [`23caad54`](https://github.com/Astroshaper/Astroshaper-examples/commit/23caad54a3335063d9c0b71bedf6e935331b5fbe) (PR [#18](https://github.com/Astroshaper/Astroshaper-examples/pull/18))
- Tag: [`v2026-07-08`](https://github.com/Astroshaper/Astroshaper-examples/tree/v2026-07-08)
- Previous state: tag [`v0.0.7-compatible`](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.7-compatible)

## v0.0.7-compatible (2025-06-06)

### AsteroidThermoPhysicalModels.jl: v0.0.6 → v0.0.7

- Updated `TPM_Ryugu` and `TPM_Didymos` for the v0.0.7 API.
- Commit: [`59b23959`](https://github.com/Astroshaper/Astroshaper-examples/commit/59b23959f6c73d9849f37711e49605cf09c51ad1) (PR [#17](https://github.com/Astroshaper/Astroshaper-examples/pull/17))
- Tag: [`v0.0.7-compatible`](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.7-compatible)
- Previous state: tag [`v0.0.6-compatible`](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.6-compatible)
