class School
  def initialize
    @students = {}
  end

  def to_h
    @students.each { |_, names| names.sort! }.sort.to_h
  end

  def add(student, grade)
    if @students.keys.include?(grade)
      @students[grade] << student
    else
      @students[grade] = [student]
    end
  end

  def grade(num)
    @students.select { |grade, _| grade == num }.values.flatten
  end
end
