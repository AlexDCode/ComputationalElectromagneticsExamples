# Computational Electromagnetics Examples
This repository provides MATLAB implementations and accompanying reports for three fundamental computational electromagnetics (CEM) methods:​

- Finite-Difference Time-Domain (FDTD)
- Finite Element Method (FEM)
- Method of Moments (MoM)

Each method is presented in its own folder, containing a MATLAB script demonstrating the numerical method and a detailed report.

## 📂 Directory Structure
- FDTD/: Finite-Difference Time-Domain method
- FEM/: Finite Element Method
- MoM/: Method of Moments

## 🛠️ Getting Started
1. Clone the repository:
2. Navigate to the desired method folder (e.g., FDTD/).
3. Open the MATLAB script (e.g., fdtd2d_aa_pml.m).​
4. Run the script to perform the simulation.​
5. Refer to the accompanying PDF report for theoretical background and analysis (e.g., fdtd_report.pdf).​

## 📚 Method Summaries
### 🟢 Finite-Difference Time-Domain (FDTD)

The FDTD method discretizes both space and time to solve Maxwell's equations numerically. By applying central-difference approximations, it updates electric and magnetic fields in a leapfrog manner. This method is particularly effective for time-domain analysis of electromagnetic wave propagation.

Here, FDTD is used to study the behavior of an ellipsoid dielectric antenna. This antenna type behaves like a microwave lens. The technique is derived from Maxwell’s Equations with an Anisotropic Absorber Perfectly Matched Layer (AA-PML) absorbing boundary condition. The algorithm is first validated with an infinite wire current source, and a series of N-Slit diffraction, PEC scattering, and dielectric scattering experiments are performed. Then, the fields within the dielectric ellipsoidal antenna and the radiation pattern are analyzed at 33 GHz.

#### Key Features:
- Time-domain analysis suitable for broadband simulations
- Straightforward implementation for simple geometries
- Incorporation of absorbing boundary conditions like Perfectly Matched Layers (PML)

#### Limitations:
- Numerical dispersion can affect accuracy, especially for coarse grids
- Requires fine meshing for high-frequency simulations


### 🔴 Finite Element Method (FEM)
FEM divides the simulation domain into smaller elements and applies variational methods to solve Maxwell's equations. It is particularly effective for complex geometries and inhomogeneous materials.​

Here, FEM is implemented for the analysis of homogeneously-filled waveguides. Waveguides are common high-power and low-loss microwave transmission lines. Simple geometries like rectangular and circular cross-sections of homogeneous media have well-known analytical solutions. For arbitrary geometries, FEM method can be used to analyze the propagation modes and cutoff frequencies numerically. The FEM method fits arbitrary geometry well, as the mesh discretization can conform to curved edges. Rectangular, ridge, circular, and coaxial cross-sections are analyzed up to the fourth propagation mode.

#### Key Features:
- Flexibility in handling complex and irregular geometries with a triangular mesh
- Suitable for both frequency-domain and time-domain analyses

#### Limitations:
- Requires mesh generation, which can be computationally intensive
- Implementation complexity increases with problem dimensionality​


### 🔵 Method of Moments (MoM)
MoM transforms integral equations derived from Maxwell's equations into a system of linear equations by expanding the unknowns into a series of basis functions using the Green's function. The MoM calculates surface currents and finds the induced fields in all space. It is predominantly used for open-region problems like antenna and scattering analyses.​

Here, MoM is implemented to calculate the input impedance, surface current, and antenna directivity for a series of dipoles. Wire antennas are represented by line segments and can be solved quickly using this technique. The impedance convergence is shown for increasing mesh discretization and compared to the analytical solution. The radiation pattern is calculated from the resulting current distribution.

#### Key Features:
- Efficient for problems involving open boundaries
- Reduces dimensionality (e.g., 3D problems to 2D surfaces)
- High accuracy with fewer unknowns compared to differential methods​

#### Limitations:
- Leads to dense system matrices, increasing computational load for large problems
- Less suited for inhomogeneous or nonlinear materials​
