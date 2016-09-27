require 'pry'
class House
  def write_rhyme
    start_phrase = "This is"
    outer_index = 11
    inner_index = nil
    
    while outer_index > 0
      puts start_phrase + ' '+ pieces[outer_index].first
      inner_index = outer_index
      
      loop do
        break if outer_index == 11
        puts pieces[inner_index].last + ' ' + pieces[inner_index + 1].first
        inner_index += 1
        break if inner_index >= 11
      end

    outer_index -= 1  
    puts ''
    end
  end
  
  
  # Launch school solution  
  # def self.recite
  #   verse = (1..pieces.size)
  #             .map {|number| pieces.last(number)}
  #             .map {|pieces| combine_pieces(pieces)}
  #             .join("\n\n")
  #   verse + "\n"
  # end

  # def self.combine_pieces(pieces)
  #   paragraph = pieces.map{|piece| piece.join("\n")}.join(" ")
  #   "This is #{paragraph}."
  # end
  
  
  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

house = House.new
house.write_rhyme
