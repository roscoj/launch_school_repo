# Ex 1
10.times {|number| puts (" " * number) + "The Flintstones Rock!"}

# Ex 2
statement = "The Flintstones Rock"
frequencies = {}

statement_split = statement.split("")

statement_split.each do |letter, freq|
  if frequencies.has_key?(letter)
    frequencies[letter] += 1
  else
    frequencies[letter] = 1
  end
end

#Ex 3
# need to turn the integers into a string to puts them
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Ex 4
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# prints 1 then three

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# prints 1 then 1 then 2


# Ex 5
def factors_v2(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors_v2(-88)

# Bonus 1. Purpose of modulus: if there is no remainder when the number is divided with the divisor, the divisor is a factor of the number
# Bonus 2. If divisors is not called, then the method returns nil


# Ex 6
# First changes the input argument while second does not change it


# Ex 7
@limit = 15

def fib(first_num, second_num)
  while second_num < @limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# Scope of the variable limit is not accessible inside the method, therefore make it an instance variable to modify scope and make accessible

# Ex 8
words = "Hello my name is Ross"
words.split.map { |word| word.capitalize }.join(' ')

# Ex 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |name, details|
  if details["age"] < 18
    details["age_group"] = "child"
  elsif details["age"] < 65
    details["age_group"] = "adult"
  elsif details["age"] > 65
    details["age_group"] = "senior"
  end
end

# Launch School Solution
# Looking over this it is the case name that I have missed - i thought it was descriptive but it is functional
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end