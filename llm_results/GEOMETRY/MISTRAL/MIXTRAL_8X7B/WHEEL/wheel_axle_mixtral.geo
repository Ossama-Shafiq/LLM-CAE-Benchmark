// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the Dimensions
R = 10; // Radius of the wheels and the axle in cm.
L = 20; // Length of the axle in cm.

// Define the Points
Point(1) = {0, 0, 0, R};
Point(2) = {0, 0, L, R}; // The second wheel is located at the other end of the axle.
Point(3) = {0, 0, L/2, R}; // The center of the axle.

// Define the Wheels
Cylinder(1) = {1, 0, 0, R, 0, L, R}; // The first wheel.
Cylinder(2) = {2, 0, 0, R, 0, L, R}; // The second wheel.

// Define the Axle
Cylinder(3) = {3, 0, 0, R/2, 0, 0, R/2}; // The axle.

// Define the Surfaces
Surface(1) = {Cylinder(1)};
Surface(2) = {Cylinder(2)};
Surface(3) = {Cylinder(3)};

// Define the Volume
Volume(1) = {Surface(1), Surface(2), Surface(3)};

// Define Physical Groups for Boundaries
Physical Surface("Wheel1") = {Surface(1)};
Physical Surface("Wheel2") = {Surface(2)};
Physical Surface("Axle") = {Surface(3)};