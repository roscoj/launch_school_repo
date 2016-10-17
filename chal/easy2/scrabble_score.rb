class Scrabble
  LETTER_SCORES = { %w(a e i o u l n r s t) => 1,
                    %w(d g) => 2,
                    %w(b c m p) => 3,
                    %w(f h v w y) => 4,
                    %w(k) => 5,
                    %w(j x) => 8,
                    %w(q z) => 10 }.freeze

  def initialize(string)
    @string = string ? string.downcase : ''
  end

  def score
    result = 0
    @string.chars.each do |letter|
      LETTER_SCORES.each do |letter_arr, score|
        result += score if letter_arr.include?(letter)
      end
    end
    result
  end

  def self.score(string)
    new(string).score
  end
end
