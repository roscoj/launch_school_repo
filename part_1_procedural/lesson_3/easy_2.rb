# Ex 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# One way
ages.each do |key, value|
  if key.include?("spot")
    puts true
  else
    puts false
  end
end

# Second way
if ages.include?("spot")
  puts true
else
  puts false
end

# Third way
p ages.key?("spot")


# Ex 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.reduce(:+)
# or
ages.values.inject(:+)


# Ex 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |name, age| age > 100 }
# or
ages.keep_if {|name, value| age < 100}


# Ex 4
munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!


# Ex 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)


# Ex 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min


# Ex 7
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")
# or
advice.match("Dino")


# Ex 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index {|name|  name.start_with?("Be")}

# Ex 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name[0, 3]
end


# Ex 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0, 3]}