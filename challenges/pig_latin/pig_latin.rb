require 'pry'
class PigLatin

  def self.vowel_first_letter?(test_word)
    %w(a e i o u).include?(test_word.chars[0])
  end
  
  def self.special_vowels?(test_word)
    %w(qu).include?(test_word.chars[0..1])
  end
  
  def self.first_to_last(word_to_modify)
    result = []
    split_word = word_to_modify.chars
    result << split_word.shift
    result.unshift(split_word)
    result.join
  end
  
  def self.translate(word)
    loop do
      break if vowel_first_letter?(word)
      word = 2.times { first_to_last(word) } if special_vowels?(word)
      break if vowel_first_letter?(word)
      word = first_to_last(word)
    end
    "#{word << 'ay'}"
  end
end

p PigLatin.translate('square')


