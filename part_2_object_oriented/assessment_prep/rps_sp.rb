require 'pry'
module Display
  def clear_screen
    system "clear"
  end
end

class Move
  attr_reader :strategy
  STRATEGIES = %w(rock paper scissors lizard spock).freeze
  
  WINNING_COMBINATIONS = [['rock', 'scissors'], ['rock', 'lizard'],
                          ['paper', 'rock'], ['paper', 'spock'],
                          ['scissors', 'paper'], ['scissors', 'lizard'],
                          ['lizard', 'paper'], ['lizard', 'spock'],
                          ['spock', 'rock'], ['spock', 'scissors']].freeze
  
  def initialize(strategy)
    @strategy = strategy
  end
  
  def >(other)
    WINNING_COMBINATIONS.include?([self.strategy, other.strategy])
  end
  
  def to_s
    "#{strategy}"
  end
end

class History
  attr_reader :stored_moves
  THRESHOLD = 0.25
  
  def initialize
    @stored_moves = []
  end
  
  def store_move(strategy)
    stored_moves << strategy
  end

  def count_of_moves
    cumulative_moves = {}
    stored_moves.each do |move|
      if cumulative_moves.keys.include?(move.strategy)
        cumulative_moves[move.strategy] += 1.0
      else
        cumulative_moves[move.strategy] = 1.0
      end
    end
    cumulative_moves
  end
  
  def percentagized_moves
    percentage_hash = {}
    count_of_moves.each do |move, freq|
      percentage_hash[move] = freq / stored_moves.size
    end
    percentage_hash
  end
  
  def to_s
    "#{stored_moves.join(', ')}"
  end
end

class Player
  attr_accessor :strategy, :score, :history
  attr_reader :name
  
  def initialize(name)
    @name = name
    @score = 0
    @history = History.new
  end
end

class Computer < Player
  ROBOTS = ['Igor', 'Intelibot', 'Freddie'].freeze


# Rule: if human plays a strategy more than 20% of the time, choose it's winner

  def choose
    self.strategy = Move.new(Move::STRATEGIES.sample)
  end
  
  
  
  
end

class Human < Player
  def choose
    self.strategy = Move.new(prompt_for_choice)
  end
  
  private
  
  def prompt_for_choice
    puts "Please choose a move: Rock, Paper Scissors Lizard or Spock"
    human_strategy = %w(rock paper scissors lizard spock).sample  #gets.chomp
    human_strategy
  end
  
end

class GameEngine
  include Display
  WINNING_SCORE = 5
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new(prompt_human_name)
    @computer = Computer.new(Computer::ROBOTS.sample)
  end
  
  
  def play
    display_welcome_message
    
    loop do
      
      loop do
        display_scores
        human.choose
        computer.choose
        store_history(human)
        store_history(computer)
        display_strategies
        display_player_history
        display_round_winner
        increment_scores
        puts "-------------------"
        break if overall_winner?
      end
      display_scores
      display_overall_winner
      reset_scores
      reset_history
    
    break unless play_again?
    end
    
    display_goodbye_message
  end
  
  private
  def store_history(player_type)
    player_type.history.stored_moves << player_type.strategy
  end
  
  def display_player_history
    puts "#{human.name}'s history:- #{human.history}"
    puts "#{computer.name}'s history:- #{computer.history}"
    puts ''
  end
  
  def reset_history
    human.history.stored_moves.clear
    computer.history.stored_moves.clear
  end
  
  def display_welcome_message
    puts "Welcome to Rock Paper Scissors Lizard Spock, #{human.name}!"
  end
  
  def display_scores
    puts "#{human.name}'s score: #{human.score} | #{computer.name}'s score is #{computer.score}"
    puts ''
  end  
  def play_again?
    puts "Play again? (y/n)"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if answer == 'y' || answer == 'n'
    end
    answer == 'y'
  end
  
  def display_goodbye_message
    puts "Goodbye"
  end
  
  def prompt_human_name
    puts "What is your name?"
    human_name = "Ross" #gets.chomp
    human_name
  end
  
  def display_strategies
    puts "#{human.name} chose #{human.strategy}"
    puts "#{computer.name} chose #{computer.strategy}"
    puts ''
  end
  
  def human_won?
    human.strategy > computer.strategy
  end
  
  def computer_won?
    computer.strategy > human.strategy
  end
  
  def display_round_winner
    if human_won?
      puts "#{human.name} wins round!"
    elsif computer_won?
      puts "#{computer.name} wins round!"    
    else
      puts "It's a tie round!"
    end
  end
  
  def increment_scores
    if human_won?
      human.score += 1
    elsif computer_won?
      computer.score += 1
    end
  end
  
  def overall_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end
  
  def display_overall_winner
    if human.score == WINNING_SCORE
      puts "Overall winner is #{human.name}"
    else
      puts "Overall winner is #{computer.name}"
    end
  end
  
  def reset_scores
    human.score = 0
    computer.score = 0
  end
end

GameEngine.new.play