L = 10; // Length of the bar in cm.

// Define points
Point(1) = {0, 0, 0, L};
Point(2) = {0, 0, L, L};
Point(3) = {0, L, L, L};
Point(4) = {0, L, 0, L};

// Define lines
Line(1) = {Point1, Point2};
Line(2) = {Point2, Point3};
Line(3) = {Point3, Point4};
Line(4) = {Point4, Point1};

// Define surfaces
// Create a line loop for the bottom face
Line Loop(Loop1) = {Line1, Line2, Line3, Line4};

// Define the bottom surface as a plane surface
Plane Surface(Surface1) = {Loop1};

// Create a line loop for each side face
Line Loop(Loop2) = {Line1, Line4};
Line Loop(Loop3) = {Line2, Line3};

// Define the side surfaces as ruled surfaces with a square cross-section of 1 cm side length
Ruled Surface(Surface2) = {Loop2, 1, "X", 1, "Y"};
Ruled Surface(Surface3) = {Loop3, 1, "X", 1, "Y"};

// Define the volume
Volume(Volume1) = {Surface1, Surface2, Surface3};

// Define physical groups for boundaries
Physical Surface("Bottom") = {Surface1};
Physical Volume("Bar") = {Volume1};