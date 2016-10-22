class BufferEmptyException < Exception
end

class BufferFullException < Exception
end

class CircularBuffer
  def initialize(buffer_limit)
    @buffer_limit = buffer_limit
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.join.empty?
    @buffer.shift
  end

  def clear
    @buffer.clear
  end

  def buffer_full?
    @buffer.size == @buffer_limit
  end

  def write(str)
    raise BufferFullException if buffer_full?
    str.nil? ? @buffer : @buffer << str
  end

  def write!(str)
    return if str.nil?
    read if buffer_full?
    write(str)
  end
end
