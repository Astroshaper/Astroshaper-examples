# TPM_Didymos

Thermophysical modeling (TPM) of the binary asteroid [Didymos](https://en.wikipedia.org/wiki/65803_Didymos) and its moon Dimorphos.

Compatible with [AsteroidThermoPhysicalModels.jl](https://github.com/Astroshaper/AsteroidThermoPhysicalModels.jl) v0.3.1.

## Setup

1. Install Julia and IJulia as described in [Getting Started](../README.md#getting-started).
2. Open `TPM_Didymos.ipynb` (see [Running the Examples](../README.md#running-the-examples)).
3. Only for the first time, uncomment and run the setup cell at the top of the notebook.
   It installs the packages listed in `Project.toml`, including the version of
   AsteroidThermoPhysicalModels.jl that the notebook was written for:

   ```julia
   using Pkg
   Pkg.activate(".")
   Pkg.instantiate()
   ```

The SPICE kernels and the shape models are downloaded by the notebook into `kernel/` and `shape/`.
The results are exported as CSV files into `output/`.
