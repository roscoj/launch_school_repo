class PhoneNumber
  attr_reader :clean_num
  BAD_NUM = '0000000000'.freeze

  def initialize(num)
    @num = num.downcase
    @clean_num = @num.gsub(/[\s[:punct:]]/, '')
  end

  def contains_letters?
    @num.match(/[a-z]/)
  end

  def incorrect_length?
    clean_num.length > 11 || clean_num.length < 10
  end

  def number
    return BAD_NUM if contains_letters? || incorrect_length?
    return clean_num if clean_num.length == 10
    return clean_num.slice(1..-1) if
      clean_num.length == 11 &&
      clean_num[0] == '1'
    BAD_NUM
  end

  def area_code
    number.slice(0..2) unless number == BAD_NUM
  end

  def to_s
    "(#{number.slice(0..2)}) #{number.slice(3..5)}-#{number.slice(6..9)}"
  end
end
