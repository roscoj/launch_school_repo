# dev notes

# Did much better on the planning side, although still could improve
# The string transformation fell down a little, and this was probably to do with planning ahead
# Overall, the problem solving path, followed the video fairly well and it was lack of experience/
# technical knowledge that showed through.

require 'pry'
class Crypto
  include Math
  attr_reader :sentence
  
  def initialize(sentence)
    @sentence = sentence
  end
  
  def normalize_plaintext
    sentence.gsub(/[^a-zA-Z1-9]/, '').downcase
  end
  
  def size
    sqrt(normalize_plaintext.length).ceil
  end
  
  def plaintext_segments
    segments = []
    start_of_slice = 0
    while start_of_slice < normalize_plaintext.length
      segments << normalize_plaintext[start_of_slice, size]
      start_of_slice += size
    end
    segments
  end
  
  def ciphertext
    encode_ciphertext
  end
  
  
  def normalize_ciphertext
    encode_ciphertext(' ')
  end
  
  def encode_ciphertext(delimeter = '')
    cipher = []
    loop do
      plaintext_segments.each do |seg|
        unless seg.slice.nil?
        cipher << seg.slice!(0)
      end
    end
  end
  
end

test = Crypto.new("Madness, and then illumination.")

test.normalize_plaintext
test.size
test.plaintext_segments
test.ciphertext