class Student
attr_accessor :name
attr_writer :grade


  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other_student)
    grade > other_student.grade
  end
  
  protected
  def grade
    @grade
  end
end

joe = Student.new('Joe', 87)
bob = Student.new('Bob', 83)

puts "well done!" if joe.better_grade_than?(bob)