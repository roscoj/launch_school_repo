require 'pry'

class Meetup
  require 'date'
  
  OPTIONS = { :first => 1,
              :second => 8,
              :third => 15,
              :fourth => 22,
              :last => -7,
              :teenth => 13 }.freeze
  
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, schedule)
    start_date = Date.new(@year, @month, OPTIONS[schedule])
    range = start_date.upto(Date.new(@year, @month, OPTIONS[schedule] + 6))
    range.select { |date| date.public_send(weekday.to_s + '?') }.first
  end
  
end

p Meetup.new(5, 2013).day(:monday, :teenth) == Date.new(2013, 5, 13)


# refactoring process:
# - Firstly, didn't codify the :first, :second etc symbols into numbers
# - Reason on the above was tried to select the days first as opposed to date
#   ranges
# - This caused problems because I couldn't think how to convert the symbols
#   to Date#monday? Date#tuesday? etc
# - public_send(symbol.to_s + '?') achieves the above

# - Had to watch walkthrough to get the solution

# Next, have another go at the problem and approach as follows:
# - codify periods as in first, second third etc into numbers
# - create array of dates which include only dates within the range above
# - detect from the array (using public_send) the day of the week using symbol
# - return the date


