class Garden
  PLANTS = {'C' => :clover,
            'G' => :grass,
            'V' => :violets,
            'R' => :radishes}.freeze
  
  CHILDREN = ['Alice', 'Bob', 'Charlie', 'David',
              'Eve', 'Fred', 'Ginny', 'Harriet',
              'Ileana', 'Joseph', 'Kincaid', 'Larry'].freeze
         
  def initialize(garden, students=CHILDREN)
    @students = students
    @garden = garden.split("\n")
    @plants_line_1 = []
    @plants_line_2 = []
    @assigned_plants = {}
    assign_lines
    assign_plants
    define_student_methods
  end
  
  def assign_lines
    @garden.first.chars.each_slice(2) { |slice| @plants_line_1 << slice }
    @garden.last.chars.each_slice(2) { |slice| @plants_line_2 << slice }
  end
  
  def assign_plants
    @students.sort.each_with_index do |student, index|
      @assigned_plants[student] = [@plants_line_1[index], @plants_line_2[index]].flatten
    end
  end
  
  def print_garden_arr(child)
    result = []
    @assigned_plants[child].each do |value|
      result << PLANTS.fetch(value)
    end
    result
  end
  
  def define_student_methods
    @students.each do |student|
      define_singleton_method(student.downcase) { print_garden_arr(student) }
    end
  end
end

# Refactoring process:
# - Started by typing out all the children methods manually - then
# looked over some solutions and found the elegant define_singleton_method
# - We can then use the above method to automatically create all the
# required methods by iterating through the student names
# - The initialize method looks a little busy but I have left it that
# way as it provides a walkthrough of the whole class
# - Maybe could remove the instantiation of the arrays/hashes