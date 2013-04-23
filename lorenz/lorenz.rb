#Calcolo valori per l'attrattore di Lorenz
##dx / dt = p (y - x)
##dy / dt = x (r - z) - y
##dz / dt = xy - c z
##P = 10, R = 28, c = 8 / 3.
##P = 28, R = 46.92, c = 4.
# 
MAX_ITERATION = 10000
h = 0.01;
P = 10.0; #numero di Prandtl
R = 28.0; #numero di Rayleigh
c = 8.0 / 3.0;
x, y, z = 0.1, 0, 0
 
0.upto(MAX_ITERATION) do |i|
  next_x = x + h * P * (y - x)
  next_y = y + h * (x * (R - z) - y)
  next_z = z + h * (x * y - c * z)
  x, y, z = next_x, next_y, next_z
  puts "#{x},#{y},#{z}"
end
