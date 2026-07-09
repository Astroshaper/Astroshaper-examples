# AGENTS.md

Instructions for AI coding agents working in this repository.

## What this repository is

Example Jupyter notebooks demonstrating [Astroshaper](https://github.com/Astroshaper) packages
(currently [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl);
more packages are expected to get their own examples over time). Each top-level `TPM_*`
directory is a self-contained Julia project (its own `Project.toml`) holding one notebook
plus a `README.md`.

## Repository layout

- `TPM_Ryugu/`, `TPM_Didymos/` — actively maintained, kept up to date with the latest
  AsteroidThermoPhysicalModels.jl API.
- `TPM_Kanamaru2021/` — **frozen**. Intentionally left on AsteroidThermoPhysicalModels.jl
  v0.0.4. Do not migrate this notebook to a newer API unless explicitly asked to — its code
  has diverged too far from later versions to update casually.
- `plot_shape.jl` (repo root) — shared PlotlyJS plotting helper, `include`d by the notebooks.
  It has no `Project.toml` of its own, so whatever packages it uses (currently
  `LinearAlgebra`, `PlotlyJS`) must be listed as deps in *every* example's `Project.toml`
  that includes it. If you add an import to this file, add the dependency to each consuming
  example's `Project.toml`, not just the one you happened to test with.

## When migrating an example to a new library version

1. Update the notebook's API calls, its `Project.toml` `[deps]`/`[compat]`, and its own
   `README.md`.
2. Update the root `README.md`'s `Compatible with: ...` line for that example, under
   `## Available Examples`.
3. Add an entry to the root `CHANGELOG.md` (date, library, old → new version, commit hash,
   PR number). See that file's "Versioning convention" section for the full policy and why
   tags are dated rather than versioned.
4. After merging, tag the merge commit with the merge date as `vYYYY-MM-DD` — this is not
   SemVer (this repo is not a registered package); the `v` is just a conventional prefix.
5. Create a GitHub Release with that same tag name; its body is the matching CHANGELOG entry.
6. Clear all notebook cell outputs and `execution_count` values before committing.

## Verifying notebook changes

Each example is its own Julia environment:

```bash
cd TPM_Ryugu   # or TPM_Didymos
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

A successful `Pkg.instantiate()` only proves dependencies resolve — actually run the
notebook end-to-end (Jupyter or an IDE's notebook UI) before calling a migration done.

## Git workflow

- Work on a feature branch and open a PR; don't push directly to `main`.
- Commit messages: Conventional Commits (`feat:`, `fix:`, `docs:`, ...), written in English.
