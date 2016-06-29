numbers = [1, 2, 3, 4]
letters = ["a", "b", "c"]

def interleave(arr1, arr2)
  new_array = []
  
  while arr1.size > 0 || arr2.size > 0
    new_array << arr1.shift
    new_array << arr2.shift
  end
  
new_array.delete(nil)  
p new_array

end

interleave(numbers, letters)
