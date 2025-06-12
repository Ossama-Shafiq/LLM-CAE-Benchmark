// Dimensions
L = 10; // Length in cm.
S = 1; // Side length of the square section in cm.

// Points
Point(1) = {0, 0, 0, S};
Point(2) = {L, 0, 0, S};
Point(3) = {L, S, 0, S};
Point(4) = {0, S, 0, S};
Point(5) = {0, 0, L, S};
Point(6) = {L, 0, L, S};
Point(7) = {L, S, L, S};
Point(8) = {0, S, L, S};

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
Line Loop(1) = {1, 2, 3, 4};
Line Loop(2) = {5, 6, 7, 8};
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};

// Volume
Surface Loop(1) = {1, 2};
Volume(1) = {1};
Physical Volume("Bar") = {1};