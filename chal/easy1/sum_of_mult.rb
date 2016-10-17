class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end
  
  def self.to(limit)
    new(3,5).to(limit)
  end
  
  def to(limit)
    result = []
    (0...limit).each do |number|
      result << number if can_be_divided_by_any?(number)
    end
    result.reduce(&:+)
  end
  
  def can_be_divided_by_any?(num)
    @numbers.each do |number|
      return true if num % number == 0
    end
    false
  end
end

# Refactoring process:
# Managed to get through the class method tests but had to look over
# the solution to finish last 4. There were some new things that 
# were thrown up:
# - new(3,5).to(limit) in the body of the class method
 
# I've purposefully kept some of the refactoring on the video out of the
# solution so I can look back over this and see it super clearly.

# Generally I don't think I approeached this one with an analytical
# enough mindset and got bogged down with the details.
# - I need to think more declaratively!!
