#Twenty-One Game#

## Overview of Construct of Game##
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

##Initial Questions##
* Data contruct for deck
I would consider a hash to be best such that the key is the suit and the worth is the value
Possible issue here with aces, unless this can be ironed out in the calculation of the total
(check with the solutions)
* Calculating totals including aces
Something like: if a hand contains an ace and the total <= 11, additionally add on a further 9
* 


loop do
  CARDS.sample
  if !SPENT_CARDS.inlude?(sample)
  SPENT_CARDS << sample
  break
  else
  end
end











