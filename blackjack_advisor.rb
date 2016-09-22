require 'pry'

# require_relative 'Cards.rb'

def obtain_player_first_card
  puts 'Please use the number 10 for face cards, and the letter \'A\' for Aces.'
  print 'Please enter your first card: '
  first_card = gets.chomp.upcase
  check_first_card_value(first_card)
end

def check_first_card_value(first_card)
  card_values = [*'2'..'10', 'A']
  if first_card == 'A'
    first_card = '11'
    puts "Your first card is a/an #{first_card}"
    obtain_player_second_card(first_card)
  elsif card_values.include?(first_card)
    obtain_player_second_card(first_card)
    puts "Your first card is a/an #{first_card}"
  else
    puts 'Invalid input. Try again'
    obtain_player_first_card
  end
end

def obtain_player_second_card(first_card)
  puts 'Please use the number 10 for face cards, and the letter \'A\' for Aces.'
  print 'Please enter your second card: '
  second_card = gets.chomp.upcase
  check_second_card_value(second_card, first_card)
end

def check_second_card_value(second_card, first_card)
  card_values = [*'2'..'10', 'A']
  if second_card == 'A'
    second_card = '11'
    puts "Your first card is a/an #{second_card}"
    sum_of_player_cards(first_card, second_card)
  elsif card_values.include?(second_card)
    puts "Your first card is a/an #{second_card}"
    sum_of_player_cards(first_card, second_card)
  else
    puts 'Invalid input. Try again'
    obtain_player_second_card
  end
end

def sum_of_player_cards(first_card, second_card)
  card_sum = first_card + second_card
  obtain_dealer_card
end

def obtain_dealer_card(card_sum)
  puts 'Please use the number 10 for face cards, and the letter \'A\' for Aces.'
  print 'Please enter the dealer card: '
end

def open_deck
  # How many decks are you playing with?
end

def compare_player_cards
  # hard hand has_key?(card_sum).has_value?(dealer)
  # soft hand
  # pairs
end

def main
  puts 'Welcome to Blackjack Advisor!'
  obtain_player_first_card

end

main if __FILE__ == $PROGRAM_NAME


# I created classes for each scenerio 1 deck, 2 deck, and 4 or more decks...
# once the user inputs number of decks I need to open those deck classes and get more user input


# print 'How many decks are we playing with? Choose \'1\', \'2\', or \'4\': '
# gets.chomp.to_i
