// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define necessary variables
L_axle = 10; // Length of the axle in cm
D_axle = 1; // Diameter of the axle in cm
D_wheel = 20; // Diameter of the wheel in cm
H_wheel = 5; // Height of the wheel in cm

// Define points
Point(1) = {0, 0, 0, 1}; // Point for the center of the first wheel
Point(2) = {0, 0, L_axle, 1}; // Point for the center of the axle
Point(3) = {0, 0, L_axle + H_wheel, 1}; // Point for the center of the second wheel

// Define cylinders for the wheel and axle
Cylinder(1) = {Point(1), Point(1), D_wheel/2, D_wheel/2, H_wheel, 1};
Cylinder(2) = {Point(2), Point(2), D_axle/2, D_axle/2, L_axle, 1};
Cylinder(3) = {Point(3), Point(3), D_wheel/2, D_wheel/2, H_wheel, 1};

// Define physical groups
Physical Volume("Wheel1") = {Volume(Cylinder1)};
Physical Volume("Wheel2") = {Volume(Cylinder3)};
Physical Volume("Axle") = {Volume(Cylinder2)};