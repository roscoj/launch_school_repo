# Ex 1
# variable greeting is inside a block. Usually an exeption would be thrown, but due to the 
# variable being inside the block this does not happen - it returns nil


# Ex 2
# => "Hi there" because it is a reference to the original object

# Ex 3
# 1. "one", "two" "three"
# => The local variables are not affected by the method

# 2. 
# => same as above

# 3.
# => "two" "three" "one" becasue the gsub! function is destructive and affects the variables outside the method


# Ex 4
  def uuid_creater
  numbers = ('0'..'9').to_a
  letters = ('a'..'z').to_a
  mixed = numbers + letters
  
  part_one = mixed.sample(8).join('')
  part_two = mixed.sample(4).join('')
  part_three = mixed.sample(4).join('')
  part_four = mixed.sample(4).join('')
  part_five = mixed.sample(12).join('')
  
  uuid = part_one + "-" + part_two + "-" + part_three + "-" + part_four + "-" + part_five
  return uuid
end

# Ex 4

# add a validation to check the number is seperations of the words:
# dot_separated_words.size == 4
# Also, instead of breaking out of the loop, return false