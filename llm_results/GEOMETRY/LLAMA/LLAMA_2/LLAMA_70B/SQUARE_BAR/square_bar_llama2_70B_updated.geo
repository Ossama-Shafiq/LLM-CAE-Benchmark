Point(1) = {0, 0, 0, 1}; // Define the origin

Point(2) = {10, 0, 0, 1}; // Define one end of the bar

Point(3) = {10, 1, 0, 1}; // Define the other end of the bar

Point(4) = {5, 1, 0, 1}; // Define a point on the square section

Point(5) = {5, -1, 0, 1}; // Define another point on the square section

Line Loop(1) = {1, 2, 3, 4, 5}; // Define the boundary of the bar

Line Loop(2) = {4, 5, 1}; // Define the square section

Line Loop(3) = {1, 4}; // Define the top surface of the bar

Line Loop(4) = {2, 5}; // Define the bottom surface of the bar

Line Loop(5) = {3, 4}; // Define the left surface of the bar

Line Loop(6) = {3, 5}; // Define the right surface of the bar

Surface Loop(1) = {Line Loop(1)}; // Define the surface loop of the bar

Surface Loop(2) = {Line Loop(2)}; // Define the surface loop of the square section

Surface Loop(3) = {Line Loop(3)}; // Define the surface loop of the top surface of the bar

Surface Loop(4) = {Line Loop(4)}; // Define the surface loop of the bottom surface of the bar

Surface Loop(5) = {Line Loop(5)}; // Define the surface loop of the left surface of the bar

Surface Loop(6) = {Line Loop(6)}; // Define the surface loop of the right surface of the bar

Plane Surface(1) = {Surface Loop(1)}; // Define the plane surface of the bar

Plane Surface(2) = {Surface Loop(2)}; // Define the plane surface of the square section

Volume(1) = {Surface Loop(1)}; // Define the volume of the bar