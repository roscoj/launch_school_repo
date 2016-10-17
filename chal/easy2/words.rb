class OddWords
  def initialize(words)
    @words = words
  end
  
  def process
    result = []
    @words.split(' ').each_with_index do |word, index|
      if index.odd?
        result << word.reverse 
      else
        result << word
      end
    end
    result.join(' ')
  end
  
end


test = OddWords.new('whats the matter with kansas')
p test.process