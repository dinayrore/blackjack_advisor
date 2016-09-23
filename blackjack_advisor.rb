require 'pry'

def obtain_player_cards(*_)
  puts 'Please use the number 10 for face cards, and the letter \'A\' for Aces.'
  print "Please enter your #{@number} card: "
  @player_card = gets.chomp.upcase
  check_card_value(@player_card)
end

def check_card_value(*_)
  card_values = [*'2'..'10']
  if @player_card == 'A'
    @player_card = '11'
    puts "Your #{@number} card has a value of #{@player_card}." "\n "
  elsif card_values.include?(@player_card)
    puts "Your #{@number} card has a value of #{@player_card}." "\n "
  else
    puts 'Invalid input. Try again.'
    obtain_player_cards
  end
end

def obtain_dealer_card
  puts 'Remember to use \'10\' for face cards, and \'A\' for Aces.'
  print 'Please enter the dealer card: '
  @dealer_card = gets.chomp.upcase
  check_dealer_card_value(@dealer_card)
end

def check_dealer_card_value(@dealer_card)
  card_values = [*'2'..'10']
  if @dealer_card == 'A'
    @dealer_card = '11'
    puts "The dealer card has a value of #{@dealer_card}." "\n "
  elsif card_values.include?(dealer_card)
    puts "The dealer card has a value of #{@dealer_card}." "\n "
  else
    puts 'Invalid input. Try again.'
    obtain_dealer_card
  end
end

def playable_decks
  puts 'So, how many decks are you playing with?'
  print "Please enter either \'1\', \'2\', or \'4\': "
  @deck_number = gets.chomp.to_i
    if @deck_number != 1 || @deck_number != 2 || @deck_number != 4
      puts 'Invalid input. Try again.'
      playable_decks
    end
end

def compare_player_cards_one_deck(player_cards)
  if player_cards[0] == player_cards[1]
    puts "So you're playing with pairs, huh..."
  elsif @player_card == '11'
    puts "Alright, I can work with this! You're playing a soft hand..."
  else
    puts "Tough luck there bro. You're playing a hard hand..."
  end
end

def sum_player_cards(player_cards)
  sum = player_cards.inject(0) { |sum, number| sum + number }
end

def open_deck
  if @deck_number == 1
     = OneDeck.new(sum, @dealer_card)
  elsif @deck_number == 2

  else

end

def main
  player_cards = []
  puts "Welcome to Blackjack Advisor! \n "
  @number = 'first'
  obtain_player_cards
  player_cards << @player_card
  @number = 'second'
  obtain_player_cards
  player_cards << @player_card
  obtain_dealer_card
  playable_decks
  sum_player_cards(player_cards)
  open_deck
  # compare player cards to determine hand, use deck_number to determine optimal move.
  #
end

main if __FILE__ == $PROGRAM_NAME

# I created classes for each scenerio 1 deck, 2 deck, and 4 or more decks...
# once the user inputs number of decks I need to open those deck classes and get more user input
