# Notes on the changes

# Improvements
# - By extracting out to have a human and computer class, it is now easier
# to address human and computer specific issues.
# - Adding extra features should now be easier with the class design

# Drawbacks
# - By subclassing, it now means we have to spend slightly extra time
# examining each subclass
# - Display winner looks sligtly confused; actually it calculates
# and displays the winner. This looks like it needs to be extracted
# out at some point soon


module DisplayMessages
  def display_welcome_message
    puts "Hey #{human.name}, welcome to Rock, Paper, Scissors!"
  end
  
  def display_goodbye_message
    puts "Thanks for playing Rock Paper Scissors. Good bye!"
  end
  
  def display_choices
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end
end

class Player
  attr_accessor :move, :name
  
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    puts "What's your name."
    n = ''
    loop do
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, can't be empty!"
    end
    self.name = n
  end
  
  def choose
    choice = nil
    loop do
      puts "Please choose a move: rock, paper or scissors."
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include? choice
      puts 'Sorry, invalid choice.'
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ['example1', 'example2'].sample
  end
  
  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end
end

class RPSgame
  include DisplayMessages
  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def display_winner
    case human.move
    when 'rock'
      puts "It's a tie" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end
  
  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be 'y' or 'n'."
    end
    return false if answer == 'n'
    return true if answer == 'y'
  end
  
  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_choices
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSgame.new.play
