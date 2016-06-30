require 'pry'

CARDS = [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A'],
        ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A'],
        ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A'],
        ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']].freeze

WINNING_SCORE = 21
COMPUTER_BREAK_POINT = 17
OVERALL_WINNING_SCORE = 5

@spent_cards = []
@player_game_total = 0
@dealer_game_total = 0

def prompt(msg)
  puts "=> #{msg}"
end

def random_selection
  selection = []
  loop do
    selection = CARDS.sample
    if !@spent_cards.include?(selection)
      @spent_cards << selection
      break
    end
  end
  selection
end

def deal_card(num_of_cards_dealt)
  hand_array = []
  num_of_cards_dealt.times { hand_array << random_selection }
  hand_array
end

def total(cards)
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > WINNING_SCORE
  end
  sum
end

def is_bust?(total)
  if total > WINNING_SCORE
    true
  else
    false
  end
end


while @player_game_total <=  OVERALL_WINNING_SCORE || @dealer_game_total <= OVERALL_WINNING_SCORE
    system 'clear'
  # loop do
    player_hand = []
    dealer_hand = []
    dealer_hand_shown = []
  
    player_hand << deal_card(2)
    dealer_hand_shown << deal_card(1)
    dealer_hand << dealer_hand_shown + deal_card(1)
  
    player_total = total(player_hand.flatten(1))
    dealer_total = total(dealer_hand.flatten(1))

    prompt "Player score: #{@player_game_total} | Dealer score: #{@dealer_game_total}"
    prompt "Your cards are:"
    prompt "#{player_hand.flatten(1)}"
    prompt "Your total: #{player_total}"
    prompt "-------------------------------------------"
    prompt "Dealer cards:"
    prompt "#{dealer_hand_shown.flatten}, plus one other..."
    prompt "-------------------------------------------"
  
    answer = nil
    loop do
      prompt "Please choose to HIT or STAY?"
      answer = gets.chomp.downcase
  
      if answer.start_with?('s')
        prompt "You chose to STAY"
        prompt "Your final hand: #{player_hand.flatten(1)}"
        prompt "Your final total: #{player_total}"
        break
      else
        player_hand << deal_card(1)
        player_total = total(player_hand.flatten(1))
        prompt "Your new cards: #{player_hand.flatten(1)}"
        prompt "Your new total: #{player_total}"
      end
  
      if is_bust?(player_total)
        @dealer_game_total += 1
        prompt "Sorry you are bust - DEALER WINS!"
        prompt "Please hit enter to continue..."
        gets
        break
      end
    end
  
    if is_bust?(player_total) == false
  
      loop do
        prompt "================================"
        prompt "Dealer turn..."
  
        if dealer_total > COMPUTER_BREAK_POINT && dealer_total > player_total
          prompt "Dealer has chosen to stay"
          prompt "Dealer final hand is #{dealer_hand.flatten(1)}"
          prompt "Dealer final total is: #{dealer_total}"
          break
        else
          prompt "Dealer has chosen to hit"
          dealer_hand << deal_card(1)
          dealer_total = total(dealer_hand.flatten(1))
          prompt "Dealer hand is #{dealer_hand.flatten(1)}"
          prompt "Dealer total is: #{dealer_total}"
        end
  
        if is_bust?(dealer_total)
          @player_game_total += 1
          prompt "Dealer is bust, and YOU WIN!."
          prompt "Please hit enter to continue..."
          gets
          break
        end
        # break
      end
    end
  
    if is_bust?(player_total) == false && is_bust?(dealer_total) == false
      if player_total > dealer_total
        prompt "================================"
        prompt "Congratulations! PLAYER WINS!"
        @player_game_total += 1
      elsif player_total == dealer_total
        prompt "================================"
        prompt "It's a TIE!!"
      elsif player_total < dealer_total
        prompt "================================"
        prompt "DEALER WINS!"
        @dealer_game_total += 1
      else
        break
      end
    end
  
  #   prompt "Play again? (y or n)"
  #   answer_go_again = gets.chomp
  #   break unless answer_go_again.downcase.start_with?('y')
  #   system 'clear'
  # end
  
  # puts '======================'
  # prompt 'Thanks for playing! Goodbye!'

# end

if @player_game_total == OVERALL_WINNING_SCORE
  prompt "Player wins overall"
  break
elsif @dealer_game_total == OVERALL_WINNING_SCORE
  prompt "Dealer wins overall"
  break
end
end