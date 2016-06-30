# def substring(string, start, finish=start)
#   split_string = string.chars
#   range = (start..finish)
#   substring_array = []
  
#   split_string.each_with_index do |letter, idx|
#     if range.include?(idx)
#       substring_array << letter
#     end
#   end
#   p substring_array.join
# end


# substring("honey", 0, 2)
# substring("honey", 1, 2)
# substring("honey", 3, 9)
# substring("honey", 2)
# substring("honey", 2, 0)


# Write a method that returns all substrings from a string
# substrings("band") => "ba" "ban" "band" "an" "and" "nd"

def substrings(string)
  substring_array = []
  string.each do |letter|
    
  end
  substring_array
end

p substrings("band")