=begin
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break if !is_a_number?(word)
  end
  return true
end

dot_separated_ip_address?("10.2.3.4")
=end

word = "1.2.4.5".split('.')
if word.size == 4
  puts "true"
else
  puts "false"
end