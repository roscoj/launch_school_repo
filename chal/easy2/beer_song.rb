class BeerSong
  def verse(num)
    write_verse(num)
  end
  
  def verses(*verse_numbers)
    result = []
    verses = (verse_numbers.min..verse_numbers.max).to_a
    
    verses.reverse_each do |num|
      result << write_verse(num)
      result << "\n" unless num == verses.min
    end
    result.join
  end

  def lyrics
    verses(99, 0)
  end
  
  def write_verse(num)
    case num
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "#{num} bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2  
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end
end
