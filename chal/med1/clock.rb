class Clock
  MAX_MINS = 1440

  def initialize(time_in_minutes)
    @time_in_mins = time_in_minutes
    @hours = time_in_minutes / 60
    @minutes = time_in_minutes % 60
  end

  def self.at(hrs, mins = 0)
    total_mins = (hrs * 60) + mins
    Clock.new(total_mins)
  end

  def to_s
    hour_read_out = format_for_read_out(@hours)
    minute_read_out = format_for_read_out(@minutes)
    "#{hour_read_out}:#{minute_read_out}"
  end

  def +(other)
    if @time_in_mins + other > MAX_MINS
      Clock.new(@time_in_mins + other - MAX_MINS)
    else
      Clock.new(@time_in_mins + other)
    end
  end

  def -(other)
    if @time_in_mins - other < 0
      Clock.new(@time_in_mins + MAX_MINS - other)
    else
      Clock.new(@time_in_mins - other)
    end
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def format_for_read_out(num)
    num < 10 ? '0' + num.to_s : num.to_s
  end
end
