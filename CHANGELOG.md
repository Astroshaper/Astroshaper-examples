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

## Unreleased

### AsteroidThermoPhysicalModels.jl: v0.2.1 → v0.3.1

- Migrated `TPM_Ryugu` and `TPM_Didymos` to the v0.3 API: `ThermoParams` with keyword
  arguments, the depth grid in a separate `GridParams`, and `subsurface_face_ids` as a
  keyword of `SingleAsteroidOutputSpec`.
- The setup cell of both notebooks now installs the packages from `Project.toml`
  (`Pkg.activate` / `Pkg.instantiate`) instead of listing `Pkg.add` calls.
- README: added a "Getting Started" section for newcomers to Julia (juliaup, IJulia, how to
  open the notebooks) and a list of useful links. The notebooks point to it.
- `plot_shape.jl`: in a Jupyter notebook `plot_shape` now returns an `InlinePlot`, which is
  displayed as HTML in an `<iframe>`. A bare PlotlyJS plot fails to display with recent
  IJulia (observed with IJulia v1.34.4 and PlotlyJS v0.18.18). Added `save_html` to save a
  plot as a standalone HTML file. No new dependency.
- Previous state: tag [`v2026-07-09`](https://github.com/Astroshaper/Astroshaper-examples/tree/v2026-07-09)

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
