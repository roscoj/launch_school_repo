# Ex 1
flintstones = %w(Fred Barney Wilma Betty BamBa Pebbles)

# Ex 2
flintstones << "Dino"

# Ex 3
flintstones.push("Dino", "Hoppy")

# Ex 4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))

# Ex 5
statement = "The Flintstones Rock!"
p statement.count('t')

# Ex 6
title = "Flintstone Family Members"
title.center(50)