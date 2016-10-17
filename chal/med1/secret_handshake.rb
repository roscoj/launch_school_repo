class SecretHandshake
  HANDSHAKES = {  0 => 'wink',
                  1 => 'double blink',
                  2 => 'close your eyes',
                  3 => 'jump',
                  4 => nil }.freeze

  def initialize(number)
    @binary_number = setup_number_array(number)
  end

  def setup_number_array(num)
    return num.to_s(2).chars if num.class == Fixnum
    return nil if num.class == String && num.chars.include?(/[a-zA-Z]/)
    num.chars
  end

  def commands
    result = []
    @binary_number.reverse.each_with_index do |char, index|
      result << HANDSHAKES[index] if char == '1'
    end
    reverse_results?(@binary_number) ? result.reverse.compact : result.compact
  end

  def reverse_results?(num_arr)
    (num_arr.size >= 5) && (num_arr.reverse[4] == '1')
  end
end
