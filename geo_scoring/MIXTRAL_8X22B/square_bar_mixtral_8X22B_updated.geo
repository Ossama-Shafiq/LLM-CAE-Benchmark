// Define the Dimensions
L = 10; // Length in cm
W = 1; // Width in cm
H = 1; // Height in cm
lc = 0.1; // Characteristic length for mesh

// Define the Points
Point(1) = {0, 0, 0, lc};
Point(2) = {W, 0, 0, lc};
Point(3) = {W, H, 0, lc};
Point(4) = {0, H, 0, lc};
Point(5) = {0, 0, L, lc};
Point(6) = {W, 0, L, lc};
Point(7) = {W, H, L, lc};
Point(8) = {0, H, L, lc};

// Define the Lines
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

// Define the Surfaces
Line Loop(1) = {1, 2, 3, 4};
Line Loop(2) = {5, 6, 7, 8};
Line Loop(3) = {9, 10, -3, -2};
Line Loop(4) = {10, 11, -4, -1};
Line Loop(5) = {11, 12, -1, -4};
Line Loop(6) = {12, 9, -2, -3};
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};

// Define the Volume
Surface Loop(1) = {1, 3, 5, 6, 4, 2};
Volume(1) = {1};

// Define Physical Groups for Boundaries
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};
Physical Surface("Side1") = {3};
Physical Surface("Side2") = {4};
Physical Surface("Side3") = {5};
Physical Surface("Side4") = {6};
Physical Volume("Bar") = {1};