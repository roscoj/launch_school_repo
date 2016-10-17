class Luhn
  def initialize(num)
    @num = num
  end

  def addends
    arr = @num.to_s.chars.reverse.map.with_index do |number, index|
      if index.odd?
        process(number.to_i)
      else
        number.to_i
      end
    end
    arr.reverse
  end

  def process(number)
    value = number * 2
    return value -= 9 if value > 10
    value
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    test_number = num * 10
    validation_flag = false
    return test_number if new(test_number).valid?

    loop do
      validation_flag = new(test_number += 1).valid?
      break if validation_flag == true
    end

    test_number
  end
end
