class SpaceObject
  attr_accessor :the_type, :distance, :angular_speed, :current_angle

  def initialize(the_type, distance_from_origin, angular_speed)
    @the_type = the_type
    @distance = distance_from_origin 
    @angular_speed = angular_speed
    @current_angle = 0.0
  end

  def step
    @current_angle += angular_speed
  end

  def current_x
    (distance * Math.cos(current_angle)).to_i
  end

  def current_y
    (distance * Math.sin(current_angle)).to_i
  end

  def current_z
    (distance * Math.cos(current_angle)).to_i
  end

  def record
    step
    "#{the_type},#{current_x},#{current_y},#{current_z}"
  end
end

def generate_n_random_space_objects(n)
  (1..n).each_with_object([]) do |n, container|
    the_types = ["C", "M", "O"]
    the_type = the_types[Random.rand(3)]
    distance = Random.rand(99900)
    speed = 1
    container << SpaceObject.new(the_type, distance, speed)
  end
end

def generate_n_records(n, solar_system)
  (1..n).each_with_object([]) do |n, rows|
    rows << Time.now.strftime("%Y-%m-%dT%H:%M:%S")
    solar_system.each do |the_object|
      rows << the_object.record
    end
    rows << "\n"
  end.join(";").gsub(";\n;", "\n").gsub(";\n", "\n")
end

tierra = SpaceObject.new("T", 500.0, 3.0)
solar_system = [tierra] + generate_n_random_space_objects(100000)

records = generate_n_records(360, solar_system)
File.open('datos.txt', 'w') {|f| f.write(records) }
