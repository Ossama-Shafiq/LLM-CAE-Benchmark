// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the Dimensions
R_wheel = 5; // Radius of the wheel in cm.
W_wheel = 2; // Width of the wheel in cm.
R_axle = 1; // Radius of the axle in cm.
L_axle = 20; // Length of the axle in cm.

// Define the Points
Point(1) = {0, 0, 0, L_axle}; // Center of the axle
Point(2) = {0, 0, L_axle/2, L_axle}; // Middle point of the axle
Point(3) = {0, 0, L_axle, L_axle}; // End of the axle
Point(4) = {0, 0, L_axle + W_wheel/2, L_axle}; // Start of the wheel
Point(5) = {0, 0, L_axle + W_wheel/2 + R_wheel, L_axle}; // End of the wheel

// Define the Cylinders
Cylinder(1) = {0, 0, 0, 0, 0, L_axle, R_axle}; // Axle
Cylinder(2) = {0, 0, L_axle + W_wheel/2, 0, 0, W_wheel, R_wheel}; // Wheel

// Define the Surfaces
Surface Loop(1) = {Cylinder1_1, Cylinder1_2, Cylinder2_1, Cylinder2_2};
Plane Surface(1) = {1};

// Define the Volume
Volume(1) = {1};

// Define Physical Groups for Boundaries
Physical Surface("Axle") = {Cylinder1_1, Cylinder1_2};
Physical Surface("Wheel") = {Cylinder2_1, Cylinder2_2};
Physical Volume("WheelAndAxle") = {1};