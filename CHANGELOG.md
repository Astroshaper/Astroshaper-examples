# Changelog

This file records when the example notebooks in this repository were updated to
track a new version of the library they demonstrate.

## Versioning convention

- Each entry below corresponds to a git tag named after the date the change was
  merged (`vYYYY-MM-DD`), e.g. [`v2026-07-08`](https://github.com/Astroshaper/Astroshaper-examples/tree/v2026-07-08).
- This repository is not a registered Julia package, so tags are not Semantic
  Versioning — they are just checkpoints you can check out to see the examples
  as they were for a specific past library version.
- The authoritative source for "which library version does this example target
  right now" is each example's own `Project.toml` `[compat]` entry, tracked in
  git history for that path.

## v2026-07-08

### AsteroidThermoPhysicalModels.jl: v0.0.7 → v0.2.1

- Migrated `TPM_Ryugu` and `TPM_Didymos` to the v0.2.1 Problem/Solver API
  (`SingleAsteroidThermoPhysicalProblem`, `solve`/`CrankNicolson`,
  `SingleAsteroidOutputSpec`, `export_solution`), and moved shape loading to
  `AsteroidShapeModels.jl`.
- Commit: [`23caad54`](https://github.com/Astroshaper/Astroshaper-examples/commit/23caad54a3335063d9c0b71bedf6e935331b5fbe) (PR [#18](https://github.com/Astroshaper/Astroshaper-examples/pull/18))
- Tag: [`v2026-07-08`](https://github.com/Astroshaper/Astroshaper-examples/tree/v2026-07-08)
- Previous state: tag [`v0.0.7-compatible`](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.7-compatible)

## 2025-06-06

### AsteroidThermoPhysicalModels.jl: v0.0.6 → v0.0.7

- Updated `TPM_Ryugu` and `TPM_Didymos` for the v0.0.7 API.
- Commit: [`59b23959`](https://github.com/Astroshaper/Astroshaper-examples/commit/59b23959f6c73d9849f37711e49605cf09c51ad1) (PR [#17](https://github.com/Astroshaper/Astroshaper-examples/pull/17))
- Tag: [`v0.0.7-compatible`](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.7-compatible)
- Previous state: tag [`v0.0.6-compatible`](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.6-compatible)
