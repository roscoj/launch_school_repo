class PerfectNumber
  def self.classify(num)
    raise RuntimeError, 'Please give a valid number' if num < 0
    
    sum_of_factors = (1...num).to_a.select { |int| num % int == 0 }.reduce(&:+)
   
    case
      when sum_of_factors == num then 'perfect'
      when sum_of_factors > num then 'abundant'
      when sum_of_factors < num then 'deficient'
    end
  end
end

# Refactoring process
# - Original implementation had sum_of_factors as a method, as this is quite a simple
#   line, I brought it under the main classify method