// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define dimensions
L = 10; // Length of the wheel in cm
D = 2; // Diameter of the axle in cm
H = 5; // Height of the wheel in cm

// Define points
Point(1) = {0, 0, 0, L/2}; // Center of the wheel
Point(2) = {0, 0, L/2, L}; // Top of the wheel
Point(3) = {0, 0, L/2, 0}; // Bottom of the wheel
Point(4) = {0, 0, 0, D/2}; // Center of the axle
Point(5) = {0, 0, D/2, D}; // Top of the axle
Point(6) = {0, 0, D/2, 0}; // Bottom of the axle

// Define lines
Line(1) = {Point(1), Point(2)};
Line(2) = {Point(2), Point(3)};
Line(3) = {Point(3), Point(1)};
Line(4) = {Point(4), Point(5)};
Line(5) = {Point(5), Point(6)};
Line(6) = {Point(6), Point(4)};

// Define surfaces
Surface(1) = {Line(1), Line(2), Line(3)};
Surface(2) = {Line(4), Line(5), Line(6)};

// Define volume
Volume(1) = {Surface(1), Surface(2)};

// Define physical groups
Physical Surface("Wheel") = {Surface(1)};
Physical Surface("Axle") = {Surface(2)};
Physical Volume("WheelAndAxle") = {Volume(1)};