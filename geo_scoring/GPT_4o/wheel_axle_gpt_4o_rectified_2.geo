// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the dimensions
L_axle = 20; // Length of the axle in cm
R_axle = 1;  // Radius of the axle in cm
R_wheel = 5; // Radius of the wheels in cm
T_wheel = 2; // Thickness of the wheels in cm

// Define the points for the axle and wheels
Point(1) = {0, 0, -T_wheel, 1};          // Base center of the first wheel
Point(2) = {0, 0, 0, 1};                 // Start of the axle
Point(3) = {0, 0, L_axle, 1};            // End of the axle
Point(4) = {0, 0, L_axle + T_wheel, 1};  // Base center of the second wheel

// Define the axle as a cylinder
Cylinder(1) = {0, 0, 0, 0, 0, L_axle, R_axle};

// Define the wheels as cylinders
Cylinder(2) = {0, 0, -T_wheel, 0, 0, T_wheel, R_wheel};  // First wheel
Cylinder(3) = {0, 0, L_axle, 0, 0, T_wheel, R_wheel};    // Second wheel

// Fuse the axle and wheels into a single volume
BooleanUnion{ Volume{1}; Delete; }{ Volume{2}; Delete; }
BooleanUnion{ Volume{1}; Delete; }{ Volume{3}; Delete; }

// Define physical groups for easy identification
Physical Volume("WheelAndAxle") = {1};