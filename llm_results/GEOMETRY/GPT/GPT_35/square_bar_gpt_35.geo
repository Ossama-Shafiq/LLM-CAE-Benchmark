// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define variables
L = 10; // Length of the bar in cm
S = 1; // Side length of the square section in cm

// Define points
Point(1) = {0, 0, 0, 1}; // Bottom left corner of the square base
Point(2) = {S, 0, 0, 1}; // Bottom right corner of the square base
Point(3) = {S, S, 0, 1}; // Top right corner of the square base
Point(4) = {0, S, 0, 1}; // Top left corner of the square base
Point(5) = {0, 0, L, 1}; // Top left corner of the bar
Point(6) = {S, 0, L, 1}; // Top right corner of the bar
Point(7) = {S, S, L, 1}; // Bottom right corner of the bar
Point(8) = {0, S, L, 1}; // Bottom left corner of the bar

// Define lines
Line(1) = {Point1, Point2};
Line(2) = {Point2, Point3};
Line(3) = {Point3, Point4};
Line(4) = {Point4, Point1};
Line(5) = {Point1, Point5};
Line(6) = {Point2, Point6};
Line(7) = {Point3, Point7};
Line(8) = {Point4, Point8};
Line(9) = {Point5, Point6};
Line(10) = {Point6, Point7};
Line(11) = {Point7, Point8};
Line(12) = {Point8, Point5};

// Define surfaces
Line Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};

// Define physical groups
Physical Surface("Bottom") = {1};