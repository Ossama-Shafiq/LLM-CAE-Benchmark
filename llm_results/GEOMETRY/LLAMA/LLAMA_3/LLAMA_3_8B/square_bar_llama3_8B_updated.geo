// Define the dimensions
L = 10; // Length in cm
W = 1; // Width in cm
H = 1; // Height in cm

// Define the points
Point(1) = {0, 0, 0, 1}; // Bottom left corner
Point(2) = {0, 0, H, 1}; // Bottom edge
Point(3) = {W, 0, H, 1}; // Bottom right corner
Point(4) = {W, 0, 0, 1}; // Left edge
Point(5) = {W, W, 0, 1}; // Top right corner
Point(6) = {0, W, 0, 1}; // Top left corner
Point(7) = {0, W, H, 1}; // Top edge
Point(8) = {W, W, H, 1}; // Right edge

// Define the lines
Line(1) = {Point(1), Point(4)}; // Left edge
Line(2) = {Point(4), Point(8)}; // Right edge
Line(3) = {Point(1), Point(2)}; // Bottom edge
Line(4) = {Point(2), Point(3)}; // Bottom right edge
Line(5) = {Point(3), Point(5)}; // Top right edge
Line(6) = {Point(5), Point(6)}; // Top edge
Line(7) = {Point(6), Point(1)}; // Top left edge
Line(8) = {Point(1), Point(4)}; // Bottom left edge

// Define the surfaces
Line Loop(1) = {Line(1), Line(2), Line(3), Line(4)}; // Bottom surface
Line Loop(2) = {Line(5), Line(6), Line(7), Line(8)}; // Top surface
Plane Surface(Surface1) = {Line Loop(1)};
Plane Surface(Surface2) = {Line Loop(2)};

// Define the volume
Surface Loop(SurfaceLoop1) = {Surface1, Surface2};
Volume(Volume1) = {SurfaceLoop1};

// Define physical groups for boundaries
Physical Surface("Bottom") = {Surface1};
Physical Surface("Top") = {Surface2};
Physical Volume("Bar") = {Volume1};