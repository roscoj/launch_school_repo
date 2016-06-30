require "pry"

  def sum(num)
    sum_total = 0
    range = (1..num).to_a
    range.each { |value| sum_total += value }
    sum_total
  end
  
  def product(num)
    product_total = 1
    range = (1..(num - 1))
    range.each { |value| product_total = (product_total * value ) }
    product_total
  end
  
  puts "Please enter a number greater than zero"
  number = gets.chomp.to_i
  
  puts "Enter 's'(SUM) or 'p' (PRODUCT)"
  operation = gets.chomp.downcase
  
  if operation == 's'
    result = sum(number)
  else
    result = product(number)
  end

puts "Total is #{result}"