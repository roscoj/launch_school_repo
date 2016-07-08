# frozen_string_literal: true
require 'pry'

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  WINNING_COMBINATIONS = [['rock', 'scissors'], ['rock', 'lizard'],
                          ['paper', 'rock'], ['paper', 'spock'],
                          ['scissors', 'paper'], ['scissors', 'lizard'],
                          ['lizard', 'paper'], ['lizard', 'spock'],
                          ['spock', 'rock'], ['spock', 'scissors']].freeze

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_COMBINATIONS.include?([value, other_move.value])
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @score = 0
    @history = []
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
      puts "Please choose a move: rock, paper, scissors, lizard or spock."
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end

  def show_history
    puts history.to_s
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  # def weighted_choice
  #   new_array = []
  #   index = 0
  #   loop do
  #     (weights[index] * 100).to_i.times do
  #       new_array << arr[index]
  #     end
  #     index += 1
  #   break if index == arr.size
  #   end
  # end
end

# class R2D2 < Computer
#   def initialize
#     @weights = [0.2, 0.2, 0.2, 0.2, 0.2]
#   end

#   def set_name
#     self.name = self.class
#   end
# end

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
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def human_won
    puts "=> #{human.name} won!"
  end

  def computer_won
    puts "=> #{computer.name} won!"
  end

  def tie
    puts "=> It's a tie"
    line_break
  end

  def display_round_outcome
    return tie unless human_win_round? || computer_win_round?
    human_win_round? ? human_won : computer_won
    line_break
  end

  def display_score
    line_break
    puts "#{human.name}: #{human.score} | #{computer.name}: #{computer.score}"
    line_break
  end

  def display_overall_winner
    puts "=> #{match_winner.name} wins the match!"
    double_line_break
  end

  def display_history
    puts "#{human.name} moves: "
    puts human.history.join(', ')
    line_break
    puts "#{computer.name} moves: "
    puts computer.history.join(', ')
    double_line_break
  end

  def main_game_display
    clear_screen
    update_score
    display_score
    display_choices
    display_round_outcome
    display_history
  end

  def display_goodbye_message
    puts "Thanks for playing Rock Paper Scissors. Good bye!"
  end

  def line_break
    puts "----------------------------------------------"
  end

  def double_line_break
    puts "=============================================="
  end

  def clear_screen
    system 'clear'
  end
end

class RPSGame
  WINNING_SCORE = 6
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
    computer.move > human.move
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

  def update_history
    human.history << human.move.value
    computer.history << computer.move.value
  end

  def reset_history
    human.history = []
    computer.history = []
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def reset_game
    clear_screen
    reset_scores
    reset_history
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
        update_history
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
