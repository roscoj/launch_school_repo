class Anagram
  def initialize(test_word)
    @test_word = test_word
  end
  
  def match(words_array)
    words_array.select do |word| 
      processed(word) == processed(@test_word) &&
      word.downcase != @test_word.downcase
    end
  end
  
  private
  
  def processed(word)
    word.downcase.chars.sort.join
  end
end

# Refactoring process:
# - Generally produced a solution very quickly and one which reflected the same
# algorithm as video solution.
# - Approached this in a much more declarative way, but maybe could have done so
#   to an even greater degree. 
#   I.e. logic in my select block is split between the block and the processed
#   method. Method name processed is maybe not ideal if it were to be used in the 
#   same was as the anagram? method from the video solution.
# -TAKE AWAY: get even more declarative and think the solution through a little more
#   thoroughly.