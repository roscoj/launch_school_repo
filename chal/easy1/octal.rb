class Octal
  BASE = 8
  NUMBERS = (0..(BASE - 1)).to_a
  
  def initialize(str_num)
    @str_num = str_num
  end
    
  def to_decimal
    return 0 if @str_num =~ /\D|[8-9]/
    result = @str_num.chars.reverse.each_with_index.map do |num, index|
      num.to_i * (BASE ** index)
    end
    result.reduce(:+)
  end
end


# Refactoring process:
# - Added a BASE constant so can now change between any base
# - Originally used a results = [], result << exp, return results construct,
#   but after looking over the solutions opted for a map instead
# - Had to look over the solution to get the regex correct, but was very close
# - Found the calculating of the bases relatively more easy than I anticipated