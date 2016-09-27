require 'pry'
class Phrase
  attr_accessor :previous_strings
  attr_reader :phrase, :word_counter

  def initialize(string)
    @phrase = string
    @word_counter = {}
    @previous_strings = []
  end

  def add_to_processed(str)
    previous_strings << str
  end

  def already_processed?(str)
    previous_strings.include?(str)
  end

  def remove_punctuation(str)
    str.gsub(/[!&@$%^:.]/, '')
  end

  def remove_quote_marks(str)
    new_string_array = []
    str.split(' ').each do |word|
      if word.chars[0] == "'" && word.chars[-1] == "'"
        new_string_array << word.slice(1, (word.length - 2))
      else
        new_string_array << word
      end
    end
    new_string_array.join(' ')
  end

  def remove_empty_strings(word_counter)
    word_counter.delete_if { |key, _| key == '' }
  end

  def standardize_string(str)
    new_string = remove_punctuation(str)
    new_string = remove_quote_marks(new_string)
    new_string
  end

  def word_count
    modified_phrase = standardize_string(phrase.downcase)
    loop do
      break if already_processed?(modified_phrase)
      add_to_processed(modified_phrase)
      modified_phrase.split(/[.,\s]/).each do |word|
        if word_counter.keys.include?(word)
          word_counter[word] += 1
        else
          word_counter[word] = 1
        end
      end
      break
    end
    remove_empty_strings(word_counter)
  end
end

something = Phrase.new("First: don't laugh. Then: don't cry.")
p something.word_count
