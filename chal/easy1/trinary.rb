class Trinary
  BASE = 3
  NUMBERS = (0..(BASE - 1)).to_a
  
  def initialize(str_num)
    @str_num = str_num
  end
    
  def to_decimal
    return 0 if @str_num =~ /\D|[3-9]/
    result = @str_num.chars.reverse.each_with_index.map do |num, index|
      num.to_i * (BASE ** index)
    end
    result.reduce(:+)
  end
end