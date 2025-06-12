// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

// Define the dimensions
AxleRadius = 1; // in cm
AxleLength = 20; // in cm
WheelRadius = 5; // in cm
WheelWidth = 2; // in cm

// Define the axle
Cylinder(1) = {0, 0, -AxleLength/2, 0, 0, AxleLength, AxleRadius};

// Define the wheels
Cylinder(2) = {0, 0, -AxleLength/2 - WheelWidth, 0, 0, WheelWidth, WheelRadius};
Cylinder(3) = {0, 0, AxleLength/2, 0, 0, WheelWidth, WheelRadius};

// Define physical groups
Physical Volume("Axle") = {1};
Physical Volume("Wheel1") = {2};
Physical Volume("Wheel2") = {3};