class PigLatin
  SINGLE_CONSONANTS = %w(b c d f g h j k l m n p q r v w y z).freeze
  DOUBLE_CONSONANTS = %w(ch qu th).freeze
  TREBLE_CONSONANTS = %w(sch squ thr).freeze
  VOWELS = %w(yt).freeze
  EXCEPTIONS = %w(xe).freeze

  def self.process(str)
    VOWELS.each do |vowel|
      return str if vowel == str[0..1]
    end

    EXCEPTIONS.each do |exc|
      return str.gsub(exc[0], '') + exc[0] if exc == str[0..1]
    end

    TREBLE_CONSONANTS.each do |cons|
      return str.gsub(cons, '') + cons if cons == str[0..2]
    end

    DOUBLE_CONSONANTS.each do |cons|
      return str.gsub(cons, '') + cons if cons == str[0..1]
    end

    SINGLE_CONSONANTS.each do |cons|
      return str.gsub(cons, '') + cons if cons == str[0]
    end
    str
  end

  def self.translate(word)
    result = []
    word.split.each do |str|
      result << process(str) + 'ay'
    end
    result.join(' ')
  end
end
