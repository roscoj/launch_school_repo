loop do # main game loop
  
  player_hand = []
  dealer_hand_shown = []
  dealer_hand_hidden = []
  player_hand << deal_card(2)
  dealer_hand_shown << deal_card(1)
  dealer_hand_hidden << deal_card(1)
  
  prompt "Dealer has dealt and your cards are:"
  prompt "#{player_hand.join(" | ")}"
  prompt "That gives you a total of: ***total***"
  p total(player_hand)
  binding.pry
  
  prompt "Your opponent is holding this card:"
  prompt "#{dealer_hand_shown.join("")}, plus one other..."


  
  loop do # player hit or stay loop
    prompt "Hit or stay?"
    hit_or_stay = gets.chomp
    break unless hit_or_stay.downcase.start_with?('h') || is_bust?(20)
      player_hand << deal_card(1)
      prompt "Your cards are now: #{player_hand.join(" | ")}"
  end

prompt "Play again? (y or n)"
answer_go_again = gets.chomp
  break unless answer_go_again.downcase.start_with?('y')
end

puts '======================'
prompt 'Thanks for playing!'