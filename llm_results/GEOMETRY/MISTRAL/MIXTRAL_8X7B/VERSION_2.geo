L = 10; // Length of a side of the cube in cm.

// Define the Points
Point(1) = {0, 0, 0, L};
Point(2) = {L, 0, 0, L};
Point(3) = {L, L, 0, L};
Point(4) = {0, L, 0, L};
Point(5) = {0, 0, L, L};
Point(6) = {L, 0, L, L};
Point(7) = {L, L, L, L};
Point(8) = {0, L, L, L};

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
Plane Surface(4) = {9};
Plane Surface(5) = {10};
Plane Surface(6) = {11};

// Define the Volume
Surface Loop(1) = {1, 2, 3, 4, 5, 6};
Volume(1) = {1};

// Define Physical Groups for Boundaries
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};
Physical Surface("Side1") = {3};
Physical Surface("Side2") = {4};
Physical Surface("Side3") = {5};
Physical Surface("Side4") = {6};
Physical Volume("Cube") = {1};