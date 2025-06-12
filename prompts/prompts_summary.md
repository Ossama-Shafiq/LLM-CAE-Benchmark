# LLM-CAE Benchmark Prompts Summary

## Geometry Generation (.geo files)

### System Prompt (Used for all geometry generation)
```
You are a helpful assistant for creating a .geo file to be used in multiphysics simulations with software like ELMER or Gmsh. Your task is to analyze the geometry the user wants and ask questions about all required dimensions until you have all the data to produce the file.

Key requirements:
- Start with: SetFactory("OpenCASCADE");
- Define dimensions as variables (e.g., L = 10; // Length in cm)
- Create physical groups for boundaries
- Output between //BEGIN_GEO and //END_GEO markers
```

### Square Bar Prompts
**User Prompt Sequence:**
1. "Create a bar with a square section. The axis of the bar is parallel to the z axis"
2. "The side length of the square cross-section is 1cm"
3. "The length of the bar along the z-axis is 10 cm"

**Expected Output:** 
- 8 points, 12 lines, 6 surfaces, 1 volume
- Dimensions: 10cm × 1cm × 1cm
- Physical groups: "Bottom", "Top", "Front", "Right", "Back", "Left", "Bar"

### Wheel & Axle Prompts
**User Prompt:**
1. "Create a wheel and axle. Keep it simple. Assume that both Wheels and axle are cylinders. The wheels are located at the two ends of the axle. The axis of all cylinders is parallel to the z axis"
2. "Radius of the wheel (Rw): 5 cm, Width of the wheel (Ww): 2 cm, Radius of the axle (Ra): 1 cm, Length of the axle (La): 20 cm"

**Expected Output:**
- 3 cylinders (2 wheels + 1 axle)
- Boolean operations to merge components (critical requirement)
- Single physical volume for BC application

---

## Simulation File Generation (.sif files)

### System Prompt (Used for all simulation generation)
```
You are a helpful assistant for creating a .sif file for use in multiphysics simulations with the ELMER software. Analyze the previous geometry and the simulation requirements the user wants.

Required sections:
- Header (with CHECK KEYWORDS Warn, Mesh DB "." ".")
- Simulation (type, iterations, output settings)
- Material (properties with correct units)
- Boundary Conditions (constraints and loads)
- Solver (equation type and settings)

Output between //BEGIN_SIF and //END_SIF markers
```

### Square Bar Simulation
**User Prompt:**
```
Create a sif file for a 'linear elasticity' simulation of a steel bar with the geometry in the geo file. 
Boundary 1 is fixed (no deformation), while Boundary 2 is subjected to a Force of 100000000 N in the y direction

Additional details:
- Simulation Type: "Steady state"
- Constants: do not include gravity
- Material Properties: use typical values for steel
- Boundary Conditions: "Boundary 1" is Bottom and "Boundary 2" is Top
```

**Key Requirements:**
- Force: 100 MN (1e8 N) in Y direction
- Material: E=210 GPa, ν=0.3, ρ=7850 kg/m³
- Fixed bottom, loaded top

### Wheel & Axle Simulation
**User Prompt:**
```
Create a sif file for a 'linear elasticity' simulation of the wheel and axle with the boundaries defined in the mesh file. 
Boundary Condition at the "Bottom" should be fixed (no deformation), while the Boundary Condition at the "Top" implies a force of 5000000000 N in the z direction

Additional details:
- Simulation Type: "Steady state"
- Constants: do not include gravity
- Material Properties: use typical values for steel
- Boundary Conditions: "Boundary 1" is Bottom and "Boundary 2" is Top
```

**Key Requirements:**
- Force: 5 GN (5e9 N) in Z direction
- Material: Same as square bar
- Fixed one wheel, loaded other wheel

---

## Critical Notes

### Geometry Generation Issues to Watch
1. **Units**: Always specify units explicitly (cm, mm, etc.)
2. **Boolean Operations**: Only GPT-4o attempted these, but failed with Volume{1} reuse error
3. **Variable Definitions**: Some LLMs forget to define variables before use

### Simulation File Common Problems
1. **Missing Sections**: Header and Material sections most commonly omitted
2. **Unit Errors**: Force values often wrong by factor of 10^6 or 10^9
3. **Material Properties**: Youngs modulus = 210e9 (Pa), not 210 (GPa)
4. **Solver Block**: Often missing equation type specification

### Success Metrics
- **Geometry**: 70% average for simple bar, 56% for assembly, 0% for working Boolean ops
- **Simulation**: 78% generate valid files, <1% error when successfully executed
