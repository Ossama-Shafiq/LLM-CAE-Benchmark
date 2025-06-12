L = 10; // Length in cm.
s = 1; // Side of the square section in cm.

// Define the Points
Point(1) = {0, 0, 0, s};
Point(2) = {L, 0, 0, s};
Point(3) = {L, s, 0, s};
Point(4) = {0, s, 0, s};
Point(5) = {0, 0, L, s};
Point(6) = {L, 0, L, s};
Point(7) = {L, s, L, s};
Point(8) = {0, s, L, s};

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
Line Loop(3) = {9, 10, 11, 12};
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};

// Define the Volume
Surface Loop(1) = {1, 2, 3};
Volume(1) = {1};

// Define Physical Groups for Boundaries
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};
Physical Surface("Side1") = {3};
Physical Volume("Cuboid") = {1};