// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the dimensions
L = 10; // Length of the bar in cm
a = 1; // Side length of the square cross-section in cm

// Define the points
Point(1) = {a/2, a/2, 0, 1};
Point(2) = {-a/2, a/2, 0, 1};
Point(3) = {-a/2, -a/2, 0, 1};
Point(4) = {a/2, -a/2, 0, 1};
Point(5) = {a/2, a/2, L, 1};
Point(6) = {-a/2, a/2, L, 1};
Point(7) = {-a/2, -a/2, L, 1};
Point(8) = {a/2, -a/2, L, 1};

// Define the lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
Line(9) = {1, 5};
Line(10) = {2, 6};
Line(11) = {3, 7};
Line(12) = {4, 8};

// Define the surfaces
Line Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};
Line Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};
Line Loop(3) = {1, -10, -5, 9};
Plane Surface(3) = {3};
Line Loop(4) = {2, -11, -6, 10};
Plane Surface(4) = {4};
Line Loop(5) = {3, -12, -7, 11};
Plane Surface(5) = {5};
Line Loop(6) = {4, -9, -8, 12};
Plane Surface(6) = {6};

// Define the volume
Surface Loop(1) = {1, 2, 3, 4, 5, 6};
Volume(1) = {1};

// Define physical groups for boundaries
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};
Physical Surface("Side1") = {3};
Physical Surface("Side2") = {4};
Physical Surface("Side3") = {5};
Physical Surface("Side4") = {6};
Physical Volume("Bar") = {1};