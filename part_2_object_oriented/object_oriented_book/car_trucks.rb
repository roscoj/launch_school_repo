#Part 1
# Ex 1
# Create a class called MyCar. When you initialize a new instance or object of the class,
# allow the user to define some instance variables that tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.

# Ex 2
# Add an accessor method to your MyCar class to change and view the color of your car.
# Then add an accessor method that allows you to view, but not modify, the year of your car.

# Part 2
# Ex 1
# Add a class method to your MyCar class that calculates the gas mileage of any car.

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  @@number_of_vehicles = 0
  
  attr_accessor :color
  attr_reader :year
  attr_reader :model
  
  
  def self.number_of_vehicles
    @@number_of_vehicles
  end
  
  def self.gas_mileage_calc(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end
  
  def speed_up(number)
    @current_speed += number
    puts "You have increased your speed by #{number} mph"
  end
  
  def brake(number)
    @current_speed -= number
    puts "You have decreased your speed by #{number} mph"
  end
  
  def current_speed
    puts "Your current speed is #{@current_speed} mph"
  end
  
  def shut_off
    @current_speed = 0
    puts "You have shut off the car, speed is now #{@current_speed} mph"
  end
  
  def spray_paint(color)
    self.color = color # => here we are accessing the setter method (attr_accessor) instead of accessing the instance variable directly
    puts "You have had a re-spray and your vehicle is now #{color}!"
  end
  
  def age
    "Your #{model} is #{years_old} years old"
  end
  
  private
  
  def years_old
    Time.now.year - self.year
  end
  
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 5
  
  def to_s
    "My car is a #{year}, #{color} #{model}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include Towable
  
  def to_s
    "My truck is a #{year}, #{color} #{model}"
  end
end

car = MyCar.new(1997, 'Ford Focus', 'red')
truck = MyTruck.new(2010, 'Ford Tundra', 'white')


puts car.age