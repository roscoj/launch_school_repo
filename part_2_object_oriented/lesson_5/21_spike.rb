module Display
  def prompt(str)
    puts "=> #{str}"
  end
  
  def line_break
    puts "------------------------"
  end
  
  def double_line_break
    puts "========================"
  end
  
  def clear
    system 'clear'
  end
  
  def padding
    puts ''
  end
  
  def press_enter_to_continue
    puts "Press enter to continue..."
    gets
  end
end

require 'pry'

class Participant
  def initialize
    @cards = []
  end
  
  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end


class Player
include Display
  def initialize
    @name = set_name
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
  end
end

class Dealer
  def deal
    # does the dealer or the deck deal?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
  
end

class Participant
  # what goes in here? all the redundant behaviors from Player and Dealer?
end

class Deck # stores all card movement e.g. spent cards
  attr_accessor :active_cards
  SUITS = ["Diamond", "Heart", "Spade", "Club"]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  
  def initialize
    @active_cards = []
    deck_setup
  end
  
  def deck_setup
    SUITS.each do |suit|
      VALUES.each do |value|
        active_cards << Card.new(suit, value)
      end
    end
  end
end

class Card
  attr_accessor :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  
  def to_s
    "#{value} of #{suit}s"
  end
end

class Game
  include Display
  def initialize
    @human = Player.new
    @computer = Dealer.new
    @new_deck = Deck.new
  end
  
  def start
    # what's the sequence of steps to execute the game play?
    
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
  
  def deal_cards
    
  end
end


Game.new.start
