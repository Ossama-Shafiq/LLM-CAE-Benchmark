// Define the dimensions
L = 10; // Length of the bar in cm
a = 1; // Side length of the square cross-section in cm

// Define the points
Point(1) = {0, 0, 0, a}; // Bottom left
Point(2) = {a, 0, 0, a}; // Bottom right
Point(3) = {a, a, 0, a}; // Top right
Point(4) = {0, a, 0, a}; // Top left
Point(5) = {0, 0, L, a}; // Top left on the top surface
Point(6) = {a, 0, L, a}; // Top right on the top surface
Point(7) = {a, a, L, a}; // Bottom right on the top surface
Point(8) = {0, a, L, a}; // Bottom left on the top surface

// Define the lines
Line(1) = {1, 2}; // Bottom edge
Line(2) = {2, 3}; // Right edge
Line(3) = {3, 4}; // Top edge
Line(4) = {4, 1}; // Left edge
Line(5) = {5, 6}; // Top edge on the top surface
Line(6) = {6, 7}; // Right edge on the top surface
Line(7) = {7, 8}; // Bottom edge on the top surface
Line(8) = {8, 5}; // Left edge on the top surface
Line(9) = {1, 5}; // Vertical edge 1
Line(10) = {2, 6}; // Vertical edge 2
Line(11) = {3, 7}; // Vertical edge 3
Line(12) = {4, 8}; // Vertical edge 4

// Define the surfaces
Line Loop(1) = {1, 2, 3, 4}; // Bottom surface
Plane Surface(1) = {1}; // Bottom surface
Line Loop(2) = {5, 6, 7, 8}; // Top surface
Plane Surface(2) = {2}; // Top surface
Line Loop(3) = {1, 10, -5, -9}; // Front surface
Plane Surface(3) = {3}; // Front surface
Line Loop(4) = {2, 11, -6, -10}; // Right surface
Plane Surface(4) = {4}; // Right surface
Line Loop(5) = {3, 12, -7, -11}; // Back surface
Plane Surface(5) = {5}; // Back surface
Line Loop(6) = {4, 9, -8, -12}; // Left surface
Plane Surface(6) = {6}; // Left surface

// Define the volume
Surface Loop(1) = {1, 2, 3, 4, 5, 6}; // Enclosing surfaces
Volume(1) = {1}; // The bar volume

// Define physical groups for boundaries
Physical Surface("Bottom") = {1}; // Bottom surface
Physical Surface("Top") = {2}; // Top surface
Physical Surface("Front") = {3}; // Front surface
Physical Surface("Right") = {4}; // Right surface
Physical Surface("Back") = {5}; // Back surface
Physical Surface("Left") = {6}; // Left surface
Physical Volume("Bar") = {1}; // The bar volume