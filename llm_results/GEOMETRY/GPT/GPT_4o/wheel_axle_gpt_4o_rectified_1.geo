// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the dimensions
L_axle = 20; // Length of the axle in cm
R_axle = 1;  // Radius of the axle in cm
R_wheel = 5; // Radius of the wheels in cm
T_wheel = 2; // Thickness of the wheels in cm

// Define the points for the axle
Point(1) = {0, 0, 0, 1};          // Base center of the axle
Point(2) = {0, 0, L_axle, 1};     // Top center of the axle

// Define the axle as a cylinder
Cylinder(1) = {0, 0, 0, 0, 0, L_axle, R_axle};

// Define the points for the wheels
Point(3) = {0, 0, -T_wheel/2, 1};          // Base center of the first wheel
Point(4) = {0, 0, L_axle + T_wheel/2, 1};  // Base center of the second wheel

// Define the wheels as cylinders
Cylinder(2) = {0, 0, -T_wheel, 0, 0, T_wheel, R_wheel};  // First wheel
Cylinder(3) = {0, 0, L_axle, 0, 0, T_wheel, R_wheel};  // Second wheel

// Define physical groups for easy identification
Physical Volume("Axle") = {1};
Physical Volume("Wheel1") = {2};
Physical Volume("Wheel2") = {3};