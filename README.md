# Astroshaper-examples

Example code for [Astroshaper](https://github.com/Astroshaper) packages.

## Overview

This repository contains example notebooks demonstrating the use of [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) for thermophysical modeling of asteroids. Shape models are handled by [AsteroidShapeModels.jl](https://github.com/Astroshaper/AsteroidShapeModels.jl).

## Getting Started

New to Julia? The steps below take you from a fresh machine to a running notebook.

### 1. Install Julia

Julia 1.10 or later is required. [juliaup](https://github.com/JuliaLang/juliaup), the official
installer and version manager, is the recommended way to install it:

```bash
# macOS / Linux
curl -fsSL https://install.julialang.org | sh

# Windows
winget install --name Julia --id 9NJNWW8PVKMN -e -s msstore
```

Open a new terminal and check the installation with `julia --version`. Useful juliaup commands:

| Command | Description |
| --- | --- |
| `juliaup status` | List the installed Julia versions |
| `juliaup update` | Update Julia to the latest release |
| `juliaup add 1.10` | Install another version (run it with `julia +1.10`) |
| `juliaup default release` | Choose the version that `julia` starts |

### 2. Install IJulia

The examples are Jupyter notebooks, which need a Jupyter kernel for Julia.
[IJulia.jl](https://github.com/JuliaLang/IJulia.jl) provides it; install it in either of the following ways.

- One-liner in a terminal:
  ```bash
  julia -e 'using Pkg; Pkg.add("IJulia")'
  ```
- Julia REPL (start `julia` and press `]` to enter the package mode):
  ```
  pkg> add IJulia
  ```

### 3. Get the examples

```bash
git clone https://github.com/Astroshaper/Astroshaper-examples.git
cd Astroshaper-examples
```

Then follow [Running the Examples](#running-the-examples).

## Available Examples

### TPM_Ryugu
Thermophysical modeling (TPM) calculation for asteroid [Ryugu](https://en.wikipedia.org/wiki/162173_Ryugu).
- Single asteroid TPM with self-shadowing and self-heating
- Energy balance check and 3D temperature map
- Compatible with: [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) v0.3.1 (see [CHANGELOG.md](CHANGELOG.md) for older versions)

### TPM_Didymos
TPM calculation for the binary asteroid system [Didymos](https://en.wikipedia.org/wiki/65803_Didymos).
- Binary asteroid TPM
- Mutual shadowing (eclipses)
- Mutual heating between primary and secondary (optional; turned off in the notebook to save computation time)
- Compatible with: [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) v0.3.1 (see [CHANGELOG.md](CHANGELOG.md) for older versions)

### TPM_Kanamaru2021
Example notebook for YORP simulation in [Kanamaru et al. (2021)](https://doi.org/10.1029/2021JE006863).
- YORP effect calculation
- Long-term rotational evolution
- Compatible with: [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) v0.0.4 only (frozen; not migrated to later versions)

## Running the Examples

Each example directory contains:
- A Jupyter notebook (`.ipynb` file)
- A `Project.toml` file specifying dependencies
- A short README

The steps below apply to `TPM_Ryugu` and `TPM_Didymos`. `TPM_Kanamaru2021` targets an old
version of the library; see its own README.

To run an example:
1. Open the notebook in the example directory in one of the following ways.
   - **JupyterLab / Jupyter Notebook**: start `julia` in the example directory and run the
     lines below. If you do not have Jupyter, IJulia offers to install it for you.
     ```julia
     using IJulia
     jupyterlab(dir=pwd())  # or notebook(dir=pwd())
     ```
   - **VS Code**: install the [Jupyter extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter),
     open the `.ipynb` file and select the Julia kernel.
2. Only for the first time, uncomment and run the setup cell at the top of the notebook.
   It installs the packages listed in `Project.toml`, in the versions the notebook was written for:
   ```julia
   using Pkg
   Pkg.activate(".")
   Pkg.instantiate()
   ```
   The first run takes several minutes, mostly for precompiling the plotting packages.
3. Run the cells from the top. The SPICE kernels and the shape models are downloaded by the notebook.

## Requirements

- Julia 1.10 or later
- Jupyter (via IJulia.jl)
- Internet connection for downloading shape models and ephemeris data, and for the 3D plots
  (plotly.js is loaded from the CDN)

## Useful Links

- [Julia documentation](https://docs.julialang.org/) — the language manual and the standard library
- [Pkg.jl documentation](https://pkgdocs.julialang.org/) — environments, `Project.toml` and package management
- [juliaup](https://github.com/JuliaLang/juliaup) — installer and version manager
- [IJulia.jl](https://julialang.github.io/IJulia.jl/stable/) — Julia kernel for Jupyter
- [Julia extension for VS Code](https://www.julia-vscode.org/)
- [AsteroidThermoPhysicalModels.jl documentation](https://astroshaper.github.io/AsteroidThermoPhysicalModels.jl/stable/)
- [AsteroidShapeModels.jl documentation](https://astroshaper.github.io/AsteroidShapeModels.jl/stable/)

## License

These examples are provided under the same license as [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) (MIT License).

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.