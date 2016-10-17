class Sieve
  def initialize(upper_limit)
    @range = (2..upper_limit).to_a
  end
  
  def primes
    @range.each do |num|
      @range.delete_if { |element| (element != num) && (element % num == 0) }
    end
  end
end


# Refactoring process

# Initial thoughts were to create a main range array and then create
# temporary arrays of muliples, which are then subtracted from
# the main range array - then return the remainder. While this works, it 
# definitely looks long-winded and I would like to be able to 
# complete the operation under a single method.

# I started exploring delete_if before looking over the solutions but couldn't
# get it to work correctly. After reading though the solution I filled in the
# last few parts which were not working. These were as follows:
# - The loop I had in place needed tearing down to make things clearer
# - The Array#each on line 7 iterates and exposes the number which can then
#   be used in a comparison and finally provide the condition to delete from the
#   range


# Original implementation below:

# def multiples_of(number)
#   result = []
#   multiplier = 2
#   loop do
#     result << number * multiplier
#     multiplier += 1
#     break if result.last > @range.last
#   end
#   result
# end

# def primes
#   start_num = @range.first
#   loop do
#     @range -= multiples_of(start_num)
#     start_num += 1
#     break if start_num > @range.last
#   end
#   @range
# end