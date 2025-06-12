// Switch to OpenCASCADE geometry kernel
SetFactory("OpenCASCADE");

L = 10; // Length in cm, assuming this applies to both axle and wheel.

Point(1) = {0, 0, 0, L}; // Base point of the first wheel at z=0.
Point(2) = {0, 0, Dz, L}; // End point of the first wheel along the Z-axis.
Point(3) = {0, H, 0, L}); // Top base point of the axle at z=H.
Point(4) = {0, H, Dz, L}); // End point of the axle along the Z-axis.

Line(1) = {Point(1), Point(2)}; // First wheel line connecting two points.
Line(2) = {Point(3), Point(4)}; // Axle line connecting its base and top endpoints.

Circle(1) = {Point(1), CenterPoint, Point(2)}; // First wheel circle with center at the midpoint of Line(1).
Circle(2) = {CenterPoint, AxisStartPoint, AxisEndPoint}; // Axle circle centered on its line.

// Assuming both wheels and axle are cylinders:
Cylinder(1) = {AxisStartPoint, CenterPoint, Point(3), Lx, Ly, Lz, Rw}; // First wheel cylinder with radius Rw.
Cylinder(2) = {CenterPoint, AxisEndPoint, Point(4), Lx, Ly, Lz, Ra}; // Axle cylinder with radius Ra.

// Physical groups for easy identification:
Physical Surface("Wheel1") = {Circle(1)};
Physical Surface("Axle") = {Line(2), Circle(2)};
Physical Volume("WheelAndAxleSystem") = {SurfaceGroup("Wheel1"), Physical Surface("Axle")};

// Ensure that the identifiers are unique and correctly referenced.

// Check for geometric consistency:
// The axle should be longer than the wheel, so Dz > L (height of the axle).
// The wheels' radius Rw should be less than or equal to Ra (radius of the axle).