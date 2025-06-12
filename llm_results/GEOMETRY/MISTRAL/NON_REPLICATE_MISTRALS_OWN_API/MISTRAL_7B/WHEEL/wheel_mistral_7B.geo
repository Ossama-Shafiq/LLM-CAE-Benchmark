// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define necessary variables
La = 20; // Length of the axle in cm
Ra = 1; // Radius of the axle in cm
Rw = 5; // Radius of the wheel in cm
Ww = 2; // Width of the wheel in cm

// Define Points
Point(1) = {0, 0, 0, 1}; // Axle center
Point(2) = {-La/2, 0, 0, 1}; // Left wheel center
Point(3) = {La/2, 0, 0, 1}; // Right wheel center

// Define Cylinders
Cylinder(1) = {Point(1), {0, 0, La}, Ra, Ra, 0}; // Axle
Cylinder(2) = {Point(2), {0, 0, La/2}, Rw, Ww/2, 0}; // Left wheel
Cylinder(3) = {Point(3), {0, 0, La/2}, Rw, Ww/2, 0}; // Right wheel

// Define Boxes for wheel disks
Box(1) = {Point(2), Point(2) + {0, 0, -Rw}, {0, Ww, 2*Rw}}; // Left wheel disk
Box(2) = {Point(3), Point(3) + {0, 0, -Rw}, {0, Ww, 2*Rw}}; // Right wheel disk

// Define Physical Groups
Physical Surface("Axle") = {Cylinder(1)};
Physical Surface("LeftWheel") = {Cylinder(2), Box(1)};
Physical Surface("RightWheel") = {Cylinder(3), Box(2)};
Physical Volume("WheelAndAxle") = {Cylinder(1), Cylinder(2), Cylinder(3), Box(1), Box(2)};