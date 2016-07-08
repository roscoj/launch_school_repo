# Notes on the changes

# Major changes
# - Addition of move class
# - Modification to the processing and display logic for the winner

# Improvements
# - With the addition of a move class, the logic of the choice method has more clarity
# - There is now scope to have more control over each moving part in the current game

# Drawbacks
# - The program has become slightly more fragmented e.g. the logic for processing winners
# has been moved up into the move class, while the logic for dispaying has remained in the
# RPSgame class
# - Further on the above point, the processing of the winner is not obvious to read due to the name
# of the instance method '<' and '>'. It would take some reading through to understand how it pieces
# together
# - The processing of the winner is not very scaleable, imagine if there were 50 different moves,
# we would need 50 instance methods per move

# Other notes
# - On top of the walk-through, I also added an attr_reader in the move class for the value. This
# way it exposes it to the instance methods without referencing the instance variables directly

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

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(value)
    @value = value
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def scissors?
    value == 'scissors'
  end

  def >(other_move)
    if rock?
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end

  def <(other_move)
    if rock?
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
  end

  def to_s
    value
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
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['example1', 'example2'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
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
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie"
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
