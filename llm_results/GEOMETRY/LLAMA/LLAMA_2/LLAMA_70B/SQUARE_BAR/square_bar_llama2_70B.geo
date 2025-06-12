// Define variables
L = 10; // Length of the bar along the z-axis (cm)
d = 1; // Diameter of the bar (cm)

// Define points
Point(1) = {0, 0, 0, L}; // Lower left corner of the bar
Point(2) = {0, 0, d, L}; // Lower right corner of the bar
Point(3) = {0, d, 0, L}; // Upper left corner of the bar
Point(4) = {0, d, d, L}; // Upper right corner of the bar

// Define lines
Line(1) = {Point(1), Point(2)}; // Bottom edge of the bar
Line(2) = {Point(2), Point(3)}; // Right edge of the bar
Line(3) = {Point(3), Point(4)}; // Top edge of the bar
Line(4) = {Point(4), Point(1)}; // Left edge of the bar

// Define surfaces
Surface(1) = {Line(1), Line(2), Line(3), Line(4)}; // Bottom surface of the bar
Surface(2) = {Line(5), Line(6), Line(7), Line(8)}; // Top surface of the bar

// Define volumes
Volume(1) = {Surface(1), Surface(2)}; // Volume of the bar

// Define physical groups for boundaries
Physical Surface("Bottom") = {Surface(1)};
Physical Surface("Top") = {Surface(2)};
Physical Volume("Bar") = {Volume(1)};