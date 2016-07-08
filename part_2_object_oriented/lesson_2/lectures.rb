# Lecture: Classes and Objects
# Ex 1, 2, 3, 4, 5
=begin
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    "#{@first_name} #{@last_name}".strip
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end
  
  def same_name?(other_name)
    self.name == other_name.name
    # name.include?(other_name.first_name) || name.include?(other_name.last_name) # => this also does the above
  end
  
  private
  
  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
  
  def to_s
    name
  end
end


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
dave = Person.new('David Howard')
jim = Person.new('James Dean')
=end



# Lecture: Inheritance

# Ex 1, 2, 3, 4

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end
  
class Dog < Pet
  def speak
    'bark!'
  end
  
  def fetch
    'fetching!'
  end
  
  def swim
    'swimming!'
  end
end

class Cat < Pet
  def speak
    "meow"
  end
end

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new


p pete.run                # => "running!"
p pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
p kitty.fetch             # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                 # => "can't swim"