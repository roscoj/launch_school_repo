# frozen_string_literal: true

require 'pry'

module Formatting
  def line_break
    puts "------------------------"
  end

  def double_line_break_with_arrow
    puts "========================-->"
  end

  def clear
    system 'clear'
  end

  def padding
    puts ''
  end

  def double_padding
    puts ''
    puts ''
  end
end

module Display
  include Formatting

  def padding_line_break_spacer
    padding
    line_break
    padding
  end

  def press_enter_to_continue
    padding
    double_line_break_with_arrow
    puts "Press enter to continue..."
    gets
  end

  def welcome_message
    clear
    padding
    puts "Hi #{player.name}! Welcome to Twenty One."
    press_enter_to_continue
  end

  def display_shuffle_message
    clear
    padding
    puts "Cards are being shuffled, let's deal!"
    press_enter_to_continue
  end

  def display_total(player_type)
    puts "#{player_type.name}'s total is #{player_type.total}"
  end

  def display_player_cards
    puts "#{player.name}'s cards:"
    puts " | #{player.cards_in_hand.join(' | ')} |"
    padding
    display_total(player)
  end

  def display_dealer_cards_full
    puts "#{dealer.name} cards:"
    puts " | #{dealer.cards_in_hand.join(' | ')} |"
    padding
    display_total(dealer)
  end

  def display_dealer_cards_hidden
    puts "#{dealer.name} cards:"
    puts " | #{dealer.cards_in_hand.first} |"
  end

  def main_gameplay_pane(full_or_hidden= :hidden)
    clear
    padding
    display_player_cards
    padding_line_break_spacer
    case full_or_hidden
    when :hidden then display_dealer_cards_hidden
    when :full then display_dealer_cards_full
    end
  end

  def display_hit_or_stay_message
    padding
    line_break
    puts "Would you like to (h)it or stay (s)tay?"
  end

  def display_stay_message
    clear
    padding
    puts "#{name} has chosen to stay."
    press_enter_to_continue
  end

  def display_hit_message
    main_gameplay_pane(:full)
    padding
    puts "+-----+"
    puts "| HIT |"
    puts "+-----+"
    press_enter_to_continue
  end

  def display_bust_message
    clear
    double_padding
    puts "+--------+"
    puts "| BUSTED |"
    puts "+--------+"
    press_enter_to_continue
  end

  def display_final_scores
    main_gameplay_pane(:full)
    double_padding
    if find_winner.nil?
      double_padding
      puts "It's a tie!"
    else
      double_padding
      puts "#{find_winner.name} is the winner!"
    end
    press_enter_to_continue
  end

  def goodbye_message
    clear
    padding
    puts "Thanks for playing Twenty One #{player.name}, goodbye!"
  end
end

module Hand
  WINNING_SCORE = 21
  include Display

  def total
    total = 0
    cards_in_hand.each do |card|
      total += 11 if card.value == 'ace'
      total += 10 if card.value.to_i == 0
      total += card.value.to_i
    end

    if hand_includes_ace? && total > WINNING_SCORE
      total -= 10
    end
    self.hand_total = total
  end

  def hand_includes_ace?
    cards_in_hand.include?('Ace')
  end

  def cards_back_in_deck
    cards_in_hand.clear
  end

  def busted?(total_score)
    total_score > WINNING_SCORE
  end

  def add_card_to_hand(card)
    cards_in_hand << card
  end
end

class Game
  attr_reader :deck, :player, :dealer
  include Display
  include Hand

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    welcome_message

    loop do
      display_shuffle_message
      initial_deal
      main_gameplay_pane
      player_turn
      dealer_turn
      display_final_scores
      break unless play_again?
      reset_game
    end

    goodbye_message
  end

  def initial_deal
    2.times do
      player.add_card_to_hand(deck.deal_card)
      dealer.add_card_to_hand(deck.deal_card)
    end
  end

  def single_card_deal(player_type)
    player_type.add_card_to_hand(deck.deal_card)
  end

  def player_hit_or_stay
    display_hit_or_stay_message
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include? answer
      puts "Sorry that's invalid, must be h or s"
    end
    return 'hit' if answer == 'h'
    return 'stay' if answer == 's'
  end

  def player_turn
    loop do
      if busted?(player.total)
        display_bust_message
        break
      end
      case player_hit_or_stay
      when 'hit'
        single_card_deal(player)
        main_gameplay_pane
      when 'stay'
        player.display_stay_message
        break
      end
    end
  end

  def dealer_turn
    loop do
      break if busted?(player.total)

      if busted?(dealer.total)
        display_bust_message
        break
      elsif dealer.total >= player.total
        dealer.display_stay_message
        break
      else
        dealer_hit
      end
    end
  end

  def dealer_hit
    single_card_deal(dealer)
    display_hit_message
  end

  def find_winner
    find_winner_if_bust
    return player if player.total > dealer.total
    return dealer if dealer.total > player.total
    nil
  end

  def find_winner_if_bust
    return dealer if busted?(player.total)
    return player if busted?(dealer.total)
  end

  def play_again?
    answer = nil
    loop do
      padding
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def reset_game
    player.cards_back_in_deck
    dealer.cards_back_in_deck
    deck.clear_active_cards
    deck.initial_setup
    deck.reset_index_count
  end
end

class Player
  attr_accessor :cards_in_hand, :hand_total
  attr_reader :name
  include Display
  include Hand

  def initialize
    @cards_in_hand = []
    @name = set_name
    @hand_total = 0
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
    answer
  end
end

class Dealer
  include Hand
  RISK_THRESHOLD = (WINNING_SCORE - 10)

  attr_accessor :cards_in_hand, :hand_total
  attr_reader :name

  def initialize
    @cards_in_hand = []
    @hand_total = 0
    @name = "Dealer"
  end
end

class Deck
  attr_accessor :active_cards, :card_indexes
  SUITS = %w(diamond heart spade club).freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"].freeze
  NUMBER_OF_CARDS = 52

  def initialize
    @active_cards = []
    @card_indexes = (NUMBER_OF_CARDS - 1)
    initial_setup
  end

  def initial_setup
    SUITS.each do |suit|
      VALUES.each do |value|
        active_cards << Card.new(suit, value)
      end
    end
  end

  def deal_card
    deleted_from_deck = active_cards.delete_at((0..card_indexes).to_a.sample)
    @card_indexes -= 1
    deleted_from_deck
  end

  def clear_active_cards
    active_cards.clear
  end

  def reset_index_count
    @card_indexes = (NUMBER_OF_CARDS - 1)
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

  def find_hand_total(player_type)
    p player_type.cards_in_hand.value
  end
end

Game.new.start
