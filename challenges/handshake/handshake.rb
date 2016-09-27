require 'pry'
class SecretHandshake
  def initialize(num)
    @num = num
  end
  
  def wink?(binary_num)
    binary_num.chars[-1] == '1'
  end
  
  def double_blink?(binary_num)
    binary_num.chars[-2] == '1'
  end
  
  def close_your_eyes?(binary_num)
    binary_num.chars[-3] == '1'
  end
  
  def jump?(binary_num)
    binary_num.chars[-4] == '1'
  end
  
  def reverse?(binary_num)
    binary_num.chars[-5] == '1'
  end
  
  def commands
    results = []
    return results if @num.class != Fixnum 
    number = @num.to_s(2)
    results << 'wink' if wink?(number)
    results << 'double blink' if double_blink?(number)
    results << 'close your eyes' if close_your_eyes?(number)
    results << 'jump' if jump?(number)
    results.reverse! if reverse?(number)
    results
  end
end

# test = SecretHandshake.new(2)
# p test.commands
