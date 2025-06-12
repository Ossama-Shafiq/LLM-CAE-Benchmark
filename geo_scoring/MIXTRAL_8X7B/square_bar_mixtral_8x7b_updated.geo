// Dimensions
L = 10; // Length in cm.
s = 1; // Side length of the square cross-section in cm.

// Points
Point(1) = {0, 0, 0, s};
Point(2) = {L, 0, 0, s};
Point(3) = {L, L, 0, s};
Point(4) = {0, L, 0, s};
Point(5) = {0, 0, -s/2, s};
Point(6) = {L, 0, -s/2, s};
Point(7) = {L, L, -s/2, s};
Point(8) = {0, L, -s/2, s};

// Lines
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

// Surfaces
Line Loop(1) = {9, 10, 11, 12};
Plane Surface(1) = {1};
Line Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};
Surface Loop(1) = {1, 2};
Volume(1) = {1};

// Physical Groups
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};
Physical Volume("Cuboid") = {1};