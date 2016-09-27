# Pascals triangle - construct a pascals triangle, such that by passing in n rows, the triangle
# is formed out of arrays



class Triangle

  def initialize(rows)
    @rows = rows
  end
  
  def rows
    triangle = []
    @rows.times { triangle << create_row(triangle.last) }
    triangle
  end
  
  def create_row(previous_row)
    return [1] if previous_row.nil?
    index_a = 0
    index_b = 1
    
    new_row = [1]
        
    
  end
  
  
end

test = Triangle.new(1)
p test.rows


#            [1]
#          [1, 1]
#        [1, 2, 1]
#      [1, 3, 3, 1]
#    [1, 4, 6, 4, 1]
# [1, 5, 10, 10, 5, 1]

# n rows contain n elements
# each calculation must start from 1