class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    primes = [2]
    test_num = 3

    until primes.size == num
      primes << test_num if prime?(test_num)
      test_num += 2
    end
    primes.last
  end

  def self.prime?(number)
    (3..Math.sqrt(number)).each do |dividor|
      return false if number % dividor == 0
    end
    true
  end
end

# Refactoring process:
# - My initial algorithm took around 4 minutes to execute
#   due the large primes
# - Clearly inefficient I investigated ways to improve the
#   effiency
# - Increment by 2 now that we know even number > 2 can't be prime
# - Most important was the square root addition. This brought
# the execution time down to half a second on the tests.
# - Also renamed the primes array from results to primes
