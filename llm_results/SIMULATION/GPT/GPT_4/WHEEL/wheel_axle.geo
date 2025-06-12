// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the dimensions
Rw = 5; // Radius of the wheel in cm
Ww = 2; // Width of the wheel in cm
Ra = 1; // Radius of the axle in cm
La = 20; // Length of the axle in cm

// Define the axle cylinder
// The axle is centered at the origin and spans from -La/2 to La/2 along the z-axis
Cylinder(1) = {0, 0, -La/2, 0, 0, La, Ra};

// Define the left wheel cylinder
// The left wheel is positioned such that its inner face is flush with the left end of the axle
Cylinder(2) = {0, 0, -La/2 - Ww, 0, 0, Ww, Rw};

// Define the right wheel cylinder
// The right wheel is positioned such that its inner face is flush with the right end of the axle
Cylinder(3) = {0, 0, La/2, 0, 0, Ww, Rw};

// Define physical groups for the axle and wheels
//Physical Volume("Axle") = {1};
//Physical Volume("LeftWheel") = {2};
//Physical Volume("RightWheel") = {3};//+
BooleanUnion{ Volume{2}; Delete; }{ Volume{1}; Delete; }
//+
BooleanUnion{ Volume{4}; Delete; }{ Volume{3}; Delete; }
Physical Volume("MainBody") = {1};

Physical Surface("Top") = {7};
Physical Surface("Bottom") = {2};