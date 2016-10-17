# Use regex to strip out all irrlevent info
# This would simply leave all the keywords which could then be processed
# 1. Clean the question - this would return a string
# 2. Process that string and return an answer
# Above is difficult as words are not categorised in an appropriate way to exclude

# Use own dictionary containing all keywords which can then be used to clean string

class WordProblem
  
  OPERATOR_WORDS = %w(plus minus divided multiplied)
  
  def initialize(question)
    @question = clean_up(question.downcase.gsub(/[[:punct:]]/, '').split(' '))
  end
  
  def clean_up(string_array)
    string_array.keep_if do |word|
      OPERATOR_WORDS.include?(word) ||
      word.integer?
    end
    p string_array
  end
  
  def answer
    
  end
end

p WordProblem.new("What is 1 plus 1 plus 1?")