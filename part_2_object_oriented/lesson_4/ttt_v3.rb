# Computer and Human subclassing from Player
# Has thrown up some issues around method calls and variable scope so quite a bit will need addressing now

require 'pry'

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


class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]             

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

  def two_computer_markers_in_line
    binding.pry
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      markers = squares.select {|element| element.marker == marker }.collect(&:marker)
      if markers.size == 2
        empty_square = squares.select {|element| element.marker == Square::INITIAL_MARKER}[0]
        return @squares.key(empty_square)
      else
      end
    end
    nil
  end
  
  def two_human_markers_in_line
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      markers = squares.select {|element| element.marker == marker }.collect(&:marker)
      if markers.size == 2
        empty_square = squares.select {|element| element.marker == Square::INITIAL_MARKER}[0]
        return @squares.key(empty_square)
      else
      end
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

class Computer
  attr_accessor :score
  attr_reader :marker, :name
  def initialize(name="Intelibot", marker='O')
    @marker = marker
    @name = name
    @score = 0
  end
end

class Human
  attr_accessor :score
  attr_reader :marker, :name
  def initialize(name, marker)
    @marker = marker
    @name = name
    @score = 0
  end
end


class TTTGame
  WINNING_SCORE = 2

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(set_name, choose_player_marker)
    @computer = Computer.new
    @current_player = nil
  end
  
  def get_comp_marker
    computer.marker
  end
  
  def get_human_marker
    human.marker
  end

  def play
    display_welcome_message
    choose_first_player

    loop do
      loop do
        clear_screen_and_display_board
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
        end
        modify_score
        display_round_result
        break if overall_winning_score?
        reset_round
        display_play_again_message
      end
      display_overall_result
      reset_scores
      break unless play_again?
      reset_match
    end
    display_goodbye_message
  end
  
  def set_name
    system 'clear'
    puts "What's your first name."
    answer = ''
    loop do
      answer = gets.chomp
      break unless answer.empty? || answer.chars.include?(' ')
      puts "Sorry, can't be empty!"
    end
    return answer
  end
  
  def choose_player_marker
    system 'clear'
    answer = nil
    loop do
      # padding
      puts "Please choose your player marker"
      # padding
      puts "=> Must be a single character <="
      answer = gets.chomp
      break if answer.chars.size == 1
      puts 'Sorry, not valid!'
    end
      return answer
  end

  private
  
  def choose_first_player
    clear
    answer = nil
    loop do
      padding
      puts "Please choose whether you or the computer goes first:"
      padding
      puts "=> 'c' for computer or 'h' for human!"
      puts double_line_break
      answer = gets.chomp.downcase
      break if ['c', 'h'].include?(answer)
      puts 'Sorry, not valid!'
    end
    if answer == 'c'
      @current_player = computer
    elsif answer == 'h'
      @current_player = human
    end
  end
  
  def modify_score
    return nil if round_winner == nil
    round_winner.score += 1
  end
  
  def display_scores
    puts "Your score: #{human.score} | Computer score: #{computer.score}"
  end
  
  def offense_square
    board.two_computer_markers_in_line
  end
  
  def defense_square
    board.two_human_markers_in_line
  end
  
  def play_square_5
    board[5] = computer.marker
  end
  
  def play_strategy(key)
    board[key] = computer.marker
  end
  
  def play_random
    board[board.unmarked_keys.sample] = computer.marker # contains syntactical sugar!
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
  
  def overall_winning_score?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def display_welcome_message
    clear
    padding
    puts "Welcome to Tic Tac Toe!"
    padding
    puts "Gameplay rules:"
    line_break
    puts "The winner is the first person to win #{WINNING_SCORE} games."
    puts "Loser from each round takes first turn on the next."
    padding
    line_break
    press_enter_to_continue
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end
  
  def joinor(arr, delimiter=', ', word='or')
    arr[-1] = "#{word} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    display_scores
    padding
    board.draw
    padding
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
  
  def overall_winner
    if human.score == WINNING_SCORE
      return human
    else
      return computer
    end
  end
  
  def display_overall_result
    clear
    double_line_break
    case overall_winner
    when human
      puts "=> You win the match!"
    else
      puts "=> Computer wins the match!"
    end
    double_line_break
    padding
  end
  
  def display_round_result
    clear_screen_and_display_board
    line_break
    case round_winner
    when human
      puts "You won the round!"
    when computer
      puts "Computer won the round"
    else
      puts "Round was tied"
    end
    press_enter_to_continue
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end
  
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

  def reset_round
    board.reset
    clear
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
  
  def display_play_again_message
    puts "Let's play again!"
    padding
    puts "Loser plays first."
    padding
    line_break
  end
end

game = TTTGame.new.play
