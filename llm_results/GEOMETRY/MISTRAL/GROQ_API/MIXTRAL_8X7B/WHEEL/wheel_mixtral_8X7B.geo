// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the Dimensions
Rw = 5; // Radius of the wheel in cm
Ww = 2; // Width of the wheel in cm
Ra = 1; // Radius of the axle in cm
La = 20; // Length of the axle in cm

// Define the Points
Point(1) = {0, 0, 0, Rw};
Point(2) = {0, Ww/2, La, Rw};
Point(3) = {Ww, Ww/2, La, Rw};
Point(4) = {Ww, 0, La, Rw};
Point(5) = {0, 0, La, Ra};
Point(6) = {0, Ww/2, La, Ra};
Point(7) = {Ww, Ww/2, La, Ra};
Point(8) = {Ww, 0, La, Ra};

// Define the Lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};

// Define the Circles (which are actually Cylinders in 3D)
Cylinder(1) = {1, 2, 0, 2*Rw, 0, 0, Rw}; // Wheel 1
Cylinder(2) = {4, 3, 0, 2*Rw, 0, 0, Rw}; // Wheel 2
Cylinder(3) = {5, 6, La, 0, 0, 0, Ra}; // Axle

// Define the Surfaces
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};
Plane Surface(7) = {7};
Plane Surface(8) = {8};

// Define the Volume
Volume(1) = {1, 2, 3, 4};

// Define Physical Groups for Boundaries
Physical Surface("Wheel1") = {1};
Physical Surface("Wheel2") = {4};
Physical Surface("Axle") = {5, 6, 7, 8};
Physical Volume("WheelAndAxle") = {1};