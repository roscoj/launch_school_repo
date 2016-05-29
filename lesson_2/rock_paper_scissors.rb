VALID_CHOICES = {rock: 'r', paper: 'p', scissors: 's', spock: 'sp', lizard: 'l'}
WIN_SCORE = 3
@player_score = 0
@computer_score = 0

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'r' && (second == 's' || second == 'l')) ||
    (first == 'p' && (second == 'r' || second == 'sp')) ||
    (first == 's' && (second == 'p' || second == 'l')) ||
    (first == 'sp' && (second == 'r' || second == 's')) ||
    (first == 'l' && (second == 'p' || second == 'l'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie.")
  end
end

def score_incrementor(player, computer)
  if win?(player, computer)
    @player_score += 1
  elsif win?(computer, player)
    @computer_score += 1
  else
  end
end

def display_current_score
  prompt "Score: Player: #{@player_score} | Computer: #{@computer_score} |"
end

def clear_screen
  system('clear') || system('cls')
end

def reset_scores
  @player_score = 0
  @computer_score = 0
end

prompt "Welcome to Rock Paper Scissors Spock Lizard"
prompt "Each round the winner gets a point - first to #{WIN_SCORE} wins the match"

loop do
  loop do
    choice = ''
    loop do
      display_current_score
      prompt("Please choose one: | r = Rock | p = Paper | s = Scissors | sp = Spock | l = Lizard |")
      choice = gets.chomp.downcase
  
      if VALID_CHOICES.value?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
  
    computer_choice = VALID_CHOICES.values.sample
  
    prompt("You chose #{VALID_CHOICES.key(choice)} and computer chose #{VALID_CHOICES.key(computer_choice)}")
  
    display_results(choice, computer_choice)
    score_incrementor(choice, computer_choice)
    
    if @player_score < WIN_SCORE && @computer_score < WIN_SCORE
      prompt "Please hit enter to continue"
      gets
      clear_screen
    elsif @player_score == WIN_SCORE
      clear_screen
      prompt "Player wins overall!"
      display_current_score
      break
    elsif @computer_score == WIN_SCORE
      clear_screen
      prompt "Computer wins overall!"
      display_current_score
      break
    else
    end
  end
  
  answer = ''
  prompt "Do you want to play again?"
  answer = gets.chomp.downcase
  if answer.include?("y")
    reset_scores
    clear_screen
  else
    prompt "Thanks for playing. Goodbye."
    break
  end
end
