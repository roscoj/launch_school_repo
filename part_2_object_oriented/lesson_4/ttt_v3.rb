# frozen_string_literal: true

module LayoutFormatting
  def line_break
    puts "--------------------------------------------------"
  end

  def double_line_break
    puts "=================================================="
  end

  def padding
    puts ''
  end

  def clear
    system "clear"
  end

  def press_enter_to_continue
    puts "Press enter to continue..."
    gets
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(arr, delimiter=', ', word='or')
    arr[-1] = "#{word} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
  end

  def titleize(word)
    word_array = []
    word.downcase.chars.each_with_index do |letter, index|
      if index == 0
        word_array << letter.upcase!
      elsif index > 0
        word_array << letter
      end
    end
    word_array.join
  end
end

module Display
  def display_welcome_message
    clear
    padding
    puts "Hi #{human.name}, welcome to Tic Tac Toe!"
    puts "You'll be playing #{computer.name} today."
    padding
    puts "Gameplay rules:"
    line_break
    puts "The winner is the first to win #{TTTGame::WINNING_SCORE} games."
    puts "Loser from each round takes first turn on the next."
    padding
    line_break
    press_enter_to_continue
  end

  def display_board
    padding
    puts "#{human.name} is #{human.marker}. " \
      "#{computer.name} is #{computer.marker}."
    line_break
    display_scores
    padding
    board.draw
    padding
  end

  def display_scores
    puts "#{human.name} score: #{human.score} |" \
    " #{computer.name} score: #{computer.score}"
  end

  def display_round_result
    clear_screen_and_display_board
    line_break
    case round_winner
    when human
      puts "#{human.name} won the round!"
    when computer
      puts "#{computer.name} won the round"
    else
      puts "Round was tied"
    end
    press_enter_to_continue
  end

  def display_overall_result
    clear
    double_line_break
    case overall_winning_player
    when human
      puts "=> #{human.name} wins the match!"
    else
      puts "=> #{computer.name} wins the match!"
    end
    double_line_break
    padding
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

module ComputerLogic
  def offense_square
    board.find_square_at_risk(computer.marker)
  end

  def defense_square
    board.find_square_at_risk(human.marker)
  end

  def play_square_5
    board[5] = computer.marker
  end

  def play_strategy(key)
    board[key] = computer.marker
  end

  def play_random
    board[board.unmarked_keys.sample] = computer.marker
  end
end

class TTTGame
  include Display
  include LayoutFormatting
  include ComputerLogic

  WINNING_SCORE = 5

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_player = nil
  end

  def play
    opening_game_screen
    loop do
      play_round
      display_overall_result
      reset_scores
      break unless play_again?
      reset_match
    end
    display_goodbye_message
  end

  private

  def opening_game_screen
    display_welcome_message
    set_first_player
  end

  def players_take_turns
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def play_round
    loop do
      clear_screen_and_display_board
      players_take_turns
      modify_score
      display_round_result
      break if overall_winning_score?
      reset_round
    end
  end

  def choose_player_message
    padding
    puts "Please choose who goes first (1-3):"
    line_break
    puts "(1) #{human.name}"
    puts "(2) #{computer.name}"
    puts "(3) Random!"
  end

  def choose_first_player
    clear
    answer = nil
    choose_player_message
    loop do
      answer = gets.chomp.downcase
      break if ['1', '2', '3'].include?(answer)
      puts 'Sorry, not valid. Must be 1, 2 or 3!'
    end
    case answer
    when '1' then return human
    when '2' then return computer
    when '3' then return [computer, human].sample
    end
  end

  def set_first_player
    @current_player = choose_first_player
  end

  def computer_moves
    if board.square_5_empty?
      play_square_5
    elsif !!offense_square
      play_strategy(offense_square)
    elsif !!defense_square
      play_strategy(defense_square)
    else
      play_random
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def modify_score
    return nil if round_winner.nil?
    round_winner.score += 1
  end

  def overall_winning_score?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def current_player_moves
    if @current_player == human
      human_moves
      @current_player = computer
    else
      computer_moves
      @current_player = human
    end
  end

  def round_winner
    case board.winning_marker
    when human.marker
      return human
    when computer.marker
      return computer
    end
    nil
  end

  def overall_winning_player
    if human.score == WINNING_SCORE
      return human
    else
      return computer
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_round
    board.reset
  end

  def reset_match
    board.reset
    clear
    choose_first_player
    clear
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end
end

class Human
  include LayoutFormatting
  attr_accessor :score
  attr_reader :marker, :name

  def initialize
    @name = set_name
    @marker = choose_player_marker
    @score = 0
  end

  def set_name
    clear
    padding
    puts "What's your first name?"
    answer = ''
    loop do
      answer = gets.chomp
      break unless answer.empty? || answer.chars.include?(' ')
      puts "Sorry, can't be empty!"
    end

    titleize(answer)
  end

  def choose_player_marker
    clear
    answer = nil
    padding
    puts "Please choose your player marker."
    puts "(Must be a single character)"
    loop do
      answer = gets.chomp.upcase
      break if answer.chars.size == 1
      puts 'Sorry, not valid!'
    end
    answer
  end
end

class Computer
  attr_accessor :score
  attr_reader :marker, :name

  def initialize(marker='O')
    @marker = marker
    @name = set_name
    @score = 0
  end

  def set_name
    @name = ['Hal', 'Chappie', 'Intelibot'].sample
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def square_5_empty?
    @squares.values_at(5).collect(&:marker).first == Square::INITIAL_MARKER
  end

  def find_square_at_risk(marker_type)
    WINNING_LINES.each do |line|
      sqs = @squares.values_at(*line)
      markers = sqs.select { |num| num.marker == marker_type }.collect(&:marker)
      next unless markers.size == 2
      empty_square = sqs.select do |element|
        element.marker == Square::INITIAL_MARKER
      end
      return @squares.key(empty_square[0])
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

TTTGame.new.play
