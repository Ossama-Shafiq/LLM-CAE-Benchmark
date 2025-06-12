// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define Points
Point(1) = {0, 0, 0, 1}; // Center of the first wheel
Point(2) = {0, 0, L_wheel, 1}; // Center of the second wheel
Point(3) = {0, 0, L_wheel + L_axle, 1}; // Center of the axle base
Point(4) = {0, 0, L_wheel + L_axle, 1}; // Center of the axle top

// Define Cylinders
Cylinder(1) = {0, 0, 0, 0, 0, L_wheel, r_wheel}; // First wheel
Cylinder(2) = {0, 0, L_wheel, 0, 0, L_wheel + L_axle, r_axle}; // Axle
Cylinder(3) = {0, 0, L_wheel + L_axle, 0, 0, L_wheel + L_axle + L_wheel, r_wheel}; // Second wheel

// Define Physical Groups
Physical Volume("Wheel1") = {1};
Physical Volume("Axle") = {2};
Physical Volume("Wheel2") = {3};