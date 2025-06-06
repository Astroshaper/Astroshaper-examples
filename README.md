# Astroshaper-examples

Example code for [Astroshaper](https://github.com/Astroshaper) packages.

## Overview

This repository contains example notebooks demonstrating the use of [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) for thermophysical modeling of asteroids.

## Compatibility

These examples are compatible with **AsteroidThermoPhysicalModels.jl v0.0.7**.

For examples compatible with other versions:
- v0.0.6: See the [v0.0.6-compatible branch](https://github.com/Astroshaper/Astroshaper-examples/tree/v0.0.6-compatible)

## Installation

1. Install Julia (1.6 or later recommended)
2. Clone this repository:
   ```bash
   git clone https://github.com/Astroshaper/Astroshaper-examples.git
   cd Astroshaper-examples
   ```
3. Navigate to the desired example directory and follow the instructions in its README

## Available Examples

### TPM_Ryugu
Thermophysical modeling (TPM) calculation for asteroid [Ryugu](https://en.wikipedia.org/wiki/162173_Ryugu).
- Single asteroid TPM
- Temperature distribution analysis
- Non-gravitational forces calculation

### TPM_Didymos
TPM calculation for the binary asteroid system [Didymos](https://en.wikipedia.org/wiki/65803_Didymos).
- Binary asteroid TPM
- Mutual shadowing (eclipses)
- Mutual heating between primary and secondary

### TPM_Kanamaru2021
Example notebook for YORP simulation in [Kanamaru et al. (2021)](https://doi.org/10.1029/2021JE006863).
- YORP effect calculation
- Long-term rotational evolution
- *Note: Currently compatible with v0.0.4 only*

## Running the Examples

Each example directory contains:
- A Jupyter notebook (`.ipynb` file)
- A `Project.toml` file specifying dependencies
- A README with specific instructions

To run an example:
1. Navigate to the example directory
2. Start Julia and activate the project:
   ```julia
   using Pkg
   Pkg.activate(".")
   Pkg.instantiate()
   ```
3. Launch Jupyter:
   ```julia
   using IJulia
   notebook()
   ```
4. Open and run the notebook

## Requirements

- Julia 1.6 or later
- Jupyter (via IJulia.jl)
- Internet connection for downloading shape models and ephemeris data

## License

These examples are provided under the same license as AsteroidThermoPhysicalModels.jl.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.