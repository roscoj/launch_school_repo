arr1 = [1, 2, 3, 4]
arr2 = [4, 6, 8, 10]

def prime?(num)
  return false if num == 1
  
  range = (2..(num - 1))
  range.each do |value|
    return false if num % value == 0
  end
  true
end

def primes_from_array(arr)
  arr.select do |value|
    prime?(value)
  end
end

# def count_primes_from_array(arr)
#   arr.count do |value|
#     prime?(value)
#   end
# end

  def count_primes_from_array(arr)
    sum_of_primes = 0
    
    arr.each do |value|
      if prime?(value)
        sum_of_primes += 1
      end
    end
    sum_of_primes
  end

p count_primes_from_array(arr1)
p count_primes_from_array(arr2)
