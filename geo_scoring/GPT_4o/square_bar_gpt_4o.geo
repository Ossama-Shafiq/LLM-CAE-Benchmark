// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the dimensions
SideLength = 1; // Side length of the square cross-section in cm
Height = 10; // Length of the bar along the z-axis in cm

// Define the points
Point(1) = {0, 0, 0, 1}; // Bottom-left corner of the base
Point(2) = {SideLength, 0, 0, 1}; // Bottom-right corner of the base
Point(3) = {SideLength, SideLength, 0, 1}; // Top-right corner of the base
Point(4) = {0, SideLength, 0, 1}; // Top-left corner of the base
Point(5) = {0, 0, Height, 1}; // Bottom-left corner of the top face
Point(6) = {SideLength, 0, Height, 1}; // Bottom-right corner of the top face
Point(7) = {SideLength, SideLength, Height, 1}; // Top-right corner of the top face
Point(8) = {0, SideLength, Height, 1}; // Top-left corner of the top face

// Define the lines
Line(1) = {1, 2}; // Bottom edge of the base
Line(2) = {2, 3}; // Right edge of the base
Line(3) = {3, 4}; // Top edge of the base
Line(4) = {4, 1}; // Left edge of the base
Line(5) = {1, 5}; // Left vertical edge
Line(6) = {2, 6}; // Right vertical edge
Line(7) = {3, 7}; // Top-right vertical edge
Line(8) = {4, 8}; // Top-left vertical edge
Line(9) = {5, 6}; // Bottom edge of the top face
Line(10) = {6, 7}; // Right edge of the top face
Line(11) = {7, 8}; // Top edge of the top face
Line(12) = {8, 5}; // Left edge of the top face

// Define the surfaces
Line Loop(1) = {1, 2, 3, 4}; // Base surface loop
Plane Surface(1) = {1}; // Base surface
Line Loop(2) = {5, 9, -6, -1}; // Front surface loop
Plane Surface(2) = {2}; // Front surface
Line Loop(3) = {6, 10, -7, -2}; // Right surface loop
Plane Surface(3) = {3}; // Right surface
Line Loop(4) = {7, 11, -8, -3}; // Back surface loop
Plane Surface(4) = {4}; // Back surface
Line Loop(5) = {8, 12, -5, -4}; // Left surface loop
Plane Surface(5) = {5}; // Left surface
Line Loop(6) = {9, 10, 11, 12}; // Top surface loop
Plane Surface(6) = {6}; // Top surface

// Define the volume
Surface Loop(1) = {1, 2, 3, 4, 5, 6}; // Surface loop enclosing the volume
Volume(1) = {1}; // Volume

// Define physical groups for boundaries
Physical Surface("Base") = {1};
Physical Surface("Front") = {2};
Physical Surface("Right") = {3};
Physical Surface("Back") = {4};
Physical Surface("Left") = {5};
Physical Surface("Top") = {6};
Physical Volume("Bar") = {1};