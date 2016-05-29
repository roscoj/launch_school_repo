# Ex 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# answer: 
# 1
# 2
# 2
# 3

# uniq does not modify the original array


# Ex 2
# 1. what is != and where should you use it?
# => not equal to to be used in a conditional/boolean (flow control)

# 2. put ! before something, like !user_name
# => signifies a "not" something (similar to above)

# 3. put ! after something, like words.uniq!
# => Bang. It usually (although not always) makes something make a permenant change to an object (such as an array)

# 4. put ? before something
# => Ternery operator for if...else

# 5. put ? after something
# => Common Ruby convention - used in methods when the method is called to ask whether something is true or false

# 6. put !! before something, like !!user_name
# => turns any object into its boolean equivalent !!user_name would return true


# Ex 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")


# Ex 4
numbers = [1, 2, 3, 4, 5]
# numbers.delete_at(1) deletes the number at index 1 - in this case 2
# numbers.delete(1) removes 1 from the array - in this case index 0
# both make destructive changes


# Ex 5
# range = (10..100).to_a
# range.include?(42)
# or
# (10..100).cover?(42)


# Ex 6
# Way 1
# famous_words = "seven years ago..."
# other_words = "Four score and "
# other_words + famous_words

# Way 2
# famous_words = "seven years ago..."
# famous_words.insert(0, "Four score and ")


# Ex 7
# Returns 42


# Ex 8
# flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# flintstones.flatten!


# Ex 9
# flintstones.assoc("Barney")


# Ex 10
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# flintstones = Hash[flintstones.map.with_index.to_a]

# or
# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end