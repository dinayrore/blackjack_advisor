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
  dealer_card = gets.chomp.upcase
  check_dealer_card_value(dealer_card)
end

def check_dealer_card_value(dealer_card)
  card_values = [*'2'..'10']
  if dealer_card == 'A'
    dealer_card = '11'
    puts "The dealer card has a value of #{dealer_card}." "\n "
  elsif card_values.include?(dealer_card)
    puts "The dealer card has a value of #{dealer_card}." "\n "
  else
    puts 'Invalid input. Try again.'
    obtain_dealer_card
  end
  dealer_card
end

def sum_of_player_cards(first_card, second_card)
  card_sum.to_s = first_card.to_i + second_card.to_i
  obtain_dealer_card
end

def open_deck
  puts 'So, how many decks are you playing with?'
  print "Please enter either \'1\', \'2\', or \'4\': "
  deck_number = gets.chomp.to_i
  
  # How many decks are you playing with?
end

def compare_player_cards
  # hard hand has_key?(card_sum).has_value?(dealer)
  # soft hand
  # pairs
end

def main
  player_cards = []
  puts 'Welcome to Blackjack Advisor!' "\n "
  @number = 'first'
  obtain_player_cards
  player_cards << @player_card
  @number = 'second'
  obtain_player_cards
  player_cards << @player_card
  obtain_dealer_card
  open_deck
end

main if __FILE__ == $PROGRAM_NAME

# I created classes for each scenerio 1 deck, 2 deck, and 4 or more decks...
# once the user inputs number of decks I need to open those deck classes and get more user input
# print 'How many decks are we playing with? Choose \'1\', \'2\', or \'4\': '
# gets.chomp.to_i
