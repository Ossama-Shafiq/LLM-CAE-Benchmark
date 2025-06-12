// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define variables
Rw = 5; // Radius of the wheel in cm
Ww = 2; // Width of the wheel in cm
Ra = 1; // Radius of the axle in cm
La = 20; // Length of the axle in cm

// Define points
Point(1) = {0, 0, 0, 0.1}; // Wheel center
Point(2) = {0, 0, La, 0.1}; // Axle center
Point(3) = {Ww/2, 0, 0, 0.1}; // Wheel edge
Point(4) = {Ww/2, 0, La, 0.1}; // Wheel edge

// Define cylinders
Cylinder(1) = {Point(1), 0, 0, 0, Rw, 0, 0, 0.1}; // Wheel
Cylinder(2) = {Point(2), 0, 0, 0, Ra, 0, 0, 0.1}; // Axle

// Define surfaces
Line Loop(1) = {Cylinder(1), Cylinder(1)};
Plane Surface(1) = {Line Loop(1)};
Line Loop(2) = {Cylinder(2), Cylinder(2)};
Plane Surface(2) = {Line Loop(2)};
Surface Loop(1) = {Plane Surface(1), Plane Surface(2)};
Volume(1) = {Surface Loop(1)};

// Define physical groups
Physical Surface("Wheel") = {Plane Surface(1)};
Physical Surface("Axle") = {Plane Surface(2)};
Physical Volume("Wheel and Axle") = {Volume(1)};