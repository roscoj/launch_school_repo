class DNA
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(other_strand)
    count = 0
    other_strand.chars.each_with_index do |letter, index|
      count += 1 unless @strand.chars[index] == letter ||
      @strand.chars[index].nil?
    end
    count
  end
end

# Refactoring process:
# - Need to look at line 10, as at the moment the alogrithm continues
#   to the end of the longest strand. We really want to find the shortest
#   and use that as the iteration and the longest inside the iterator.
#   This then gives us a more efficient algorithm as it stops at the
#   optimum point instead of carrying through.
  
# - So refactoring would involve the automatic assignment of each
#   strand - longest and shortest.

# After watching the solution video it's now obvious that I should have
# first found the shortest strand length and only iterated that many times
# I.e. traverse both strings in one loop and use the length as indexes
