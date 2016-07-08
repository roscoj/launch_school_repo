# frozen_string_literal: true

# Notes on the changes

# Major changes
# - Addition of score keeping
# - Addition of overall winners

# Improvements
# Methods have been split up and modularised somewhat

# Drawbacks

# Other notes

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
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
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

module Display
  def display_welcome_message
    clear_screen
    puts "Hey #{human.name}, welcome to Rock, Paper, Scissors!"
    puts "Winner is the first player to reach #{RPSGame::WINNING_SCORE} points."
    puts "Press enter to continue..."
    gets
    clear_screen
  end

  def display_choices
    line_break
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_round_outcome
    if human.move > computer.move
      puts "=> #{human.name} won!"
    elsif human.move < computer.move
      puts "=> #{computer.name} won!"
    else
      puts "=> It's a tie"
    end
  end

  def display_score
    line_break
    puts "#{human.name}: #{human.score} | #{computer.name}: #{computer.score}"
    line_break
  end

  def display_overall_winner
    puts "#{match_winner.name} wins the match!"
    double_line_break
  end

  def main_game_display
    clear_screen
    display_choices
    display_round_outcome
    update_score
    display_score
  end

  def display_goodbye_message
    puts "Thanks for playing Rock Paper Scissors. Good bye!"
  end

  def line_break
    puts "------------------------------"
  end

  def double_line_break
    puts "=============================="
  end

  def clear_screen
    system 'clear'
  end
end

class RPSGame
  WINNING_SCORE = 3
  include Display
  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def human_win_round?
    human.move > computer.move
  end

  def computer_win_round?
    human.move < computer.move
  end

  def match_winner
    human.score > computer.score ? human : computer
  end

  def winning_score?
    (human.score == WINNING_SCORE) || (computer.score == WINNING_SCORE)
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

  def update_score
    if human_win_round?
      human.score += 1
    elsif computer_win_round?
      computer.score += 1
    end
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def reset_game
    clear_screen
    reset_scores
  end

  def make_choices
    human.choose
    computer.choose
  end

  def play
    display_welcome_message
    loop do
      loop do
        make_choices
        main_game_display
        break if winning_score?
      end
      display_overall_winner
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end
end

RPSGame.new.play
