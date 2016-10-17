class Phrase
  def initialize(phrase)
    @phrase = phrase.split(/[\s,]/)
                    .select { |word| word.match(/[[[:alnum:]]]/) }
                    .map { |word| transform(word) }
  end
  
  def word_count
    word_log = {}
    @phrase.each do |word|
      if word_log.keys.include?(word)
        word_log[word] += 1
      else
        word_log[word] = 1
      end
    end
    word_log
  end
end

def transform(word)
  word.gsub(/[^[[:alnum:]]']|^'|'$/, '').downcase
end

# Refactoring process:
# - Passed through all tests but last one. Found that I had coded myself
# into a corner and was getting more and more complicated to get out.
# - Real reason for this is not making the solution scalable in the sense
# of being able to add further use cases to the original codebase.
# - I think a critical error was not processing the word rationally.
# I.e. first split, then select, then transform, finally add word to hash
# - A little more depth of knowledge may have helped here also