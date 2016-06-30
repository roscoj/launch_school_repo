require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
WINNING_SCORE = 5

@player_score = 0
@computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(orig_array)
  array_two = []
  array_three = []
  orig_array.each do |num|
    if orig_array.size <= 1
      return orig_array.join
    elsif  num != orig_array.last
      array_two << num.to_s
    else
      array_three << "or " + num.to_s
    end
  end
  final_array = array_two + array_three
  final_array.join(', ')
end

def display_board(brd)
  system 'clear'
  puts "Player = #{PLAYER_MARKER} | Computer = #{COMPUTER_MARKER}"
  puts "Player score: #{@player_score} | Computer score: #{@computer_score}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

board = initialize_board
display_board(board)

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |key, value| line.include?(key) && value == ' ' }.keys.first
  end
end

  
def offensive_move(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def defensive_move(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def square_5_if_available(brd)
  square = nil
  if empty_squares(brd).include?(5)
    square = 5
  end
  square
end

def random_square(brd)
  return empty_squares(brd).sample
end

def computer_places_piece!(brd)
  square = offensive_move(brd)
  square = defensive_move(brd) unless square
  square = square_5_if_available(brd) unless square
  square = random_square(brd) unless square

  brd[square] = COMPUTER_MARKER
end


def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  @player_score = 0
  @computer_score = 0

  loop do
    board = initialize_board

    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      display_board(board)
      prompt "#{detect_winner(board)} won this game!"
      if detect_winner(board) == "Player"
        @player_score += 1
      elsif detect_winner(board) == "Computer"
        @computer_score += 1
      end

      if @player_score == WINNING_SCORE
        display_board(board)
        puts "==================="
        prompt "Player won overall!"
        break
      elsif @computer_score == WINNING_SCORE
        display_board(board)
        puts "==================="
        prompt "Computer won overall!"
        break
      else
        puts "Hit enter to continue."
        gets
      end
    else
      prompt "It's a tie!"
      puts "Hit enter to continue."
      gets
    end
  end
  prompt "Play again (y or n)?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts "==================="
prompt "Thanks for playing Tic Tac Toe, goodbye!"
