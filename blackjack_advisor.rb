require 'pry'
require_relative 'blackjack_cards'
require_relative 'one_deck'
require_relative 'two_decks'
require_relative 'four_decks'

def start_program
  puts "Welcome to Blackjack Advisor! \n "
end

def obtain_players_first_card
  puts 'Please use the number 10 for face cards, and the letter \'A\' for Aces.'
  print 'Please enter your first card: '

  players_first_card = gets.chomp.upcase

  if ![*'2'..'10', 'A'].include?(players_first_card)
    obtain_players_first_card

  else
  first_card = BlackjackCards.new(players_first_card.to_i)
  first_card.check_player_card_values(players_first_card.to_i)
  players_first_card = first_card.value
  end
end

def obtain_players_second_card
  print 'Please enter your second card: '

  players_second_card = gets.chomp.upcase

  if ![*'2'..'10', 'A'].include?(players_second_card)
    obtain_players_second_card

  else
  second_card = BlackjackCards.new(players_second_card.to_i)
  second_card.check_player_card_values(players_second_card.to_i)
  players_second_card = second_card.value
  end
end

def obtain_dealer_card
  puts 'Remember to use \'10\' for face cards, and \'A\' for Aces.'
  print 'Please enter the dealer card: '

  dealer_card = gets.chomp.upcase

  if ![*'2'..'10', 'A'].include?(dealer_card)
    obtain_dealer_card

  else
  dealer = BlackjackCards.new(dealer_card)
  dealer.check_dealer_card_value(dealer_card)
  dealer_card = dealer.value
  end
end

def check_deck_number
  puts 'So, how many decks are you playing with?'
  print "Please enter either \'1\', \'2\', or \'4\': "

  deck_number = gets.chomp.to_i

  if ![1, 2, 4].include?(deck_number)
    puts 'Invalid input. Try again.'
    check_deck_number

  else
    decks = BlackjackCards.new(deck_number)
    deck_number = decks.value
  end
end

def compare_player_cards(players_first_card, players_second_card, dealer_card, deck_number, sum)
  if players_first_card == players_second_card
    puts "So you're playing with pairs, huh..."
    search_for_pairs(deck_number, players_first_card, dealer_card)
  elsif players_first_card == 11 || players_second_card == 11
    puts "Alright, I can work with this! You're playing a soft hand..."
    search_soft_hand(deck_number, sum, dealer_card)
  else
    puts "Tough luck there bro. You're playing a hard hand..."
    search_hard_hand(deck_number, sum, dealer_card)
  end
end

def search_for_pairs(deck_number, players_first_card, dealer_card)
  if deck_number == 1
    pairs_one_deck(players_first_card, dealer_card)
  elsif deck_number == 2
    pairs_two_decks(players_first_card, dealer_card)
  else
    pairs_four_decks(players_first_card, dealer_card)
  end
end

def pairs_one_deck(players_first_card, dealer_card)
  play = OneDeck.new
  play.pairs.each do |player_key, value|
    if player_key.include?(players_first_card)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def pairs_two_decks(players_first_card, dealer_card)
  play = TwoDecks.new
  play.pairs.each do |player_key, value|
    if player_key.include?(players_first_card)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def pairs_four_decks(players_first_card, dealer_card)
  play = FourDecks.new
  play.pairs.each do |player_key, value|
    if player_key.include?(players_first_card)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def search_soft_hand(deck_number, sum, dealer_card)
  if deck_number == 1
    soft_hand_one_deck(sum, dealer_card)
  elsif deck_number == 2
    soft_hand_two_decks(sum, dealer_card)
  else
    soft_hand_four_decks(sum, dealer_card)
  end
end

def soft_hand_one_deck(sum, dealer_card)
  play = OneDeck.new
  play.soft_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def soft_hand_two_decks(sum, dealer_card)
  play = TwoDecks.new
  play.soft_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def soft_hand_four_decks(sum, dealer_card)
  play = FourDecks.new
  play.soft_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(@dealer_card)
          return action_value
        end
      end
    end
  end
end

def search_hard_hand(deck_number, sum, dealer_card)
  if deck_number == 1
    hard_hand_one_deck(sum, dealer_card)
  elsif deck_number == 2
    hard_hand_two_decks(sum, dealer_card)
  else
    hard_hand_four_decks(sum, dealer_card)
  end
end

def hard_hand_one_deck(sum, dealer_card)
  play = OneDeck.new
  play.hard_hand.each do |player_key, value|
    if player_key.include?(sum.to_s)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card.to_s)
          puts action_value
        end
      end
    end
  end
end

def hard_hand_two_decks(sum, dealer_card)
  play = TwoDecks.new
  play.hard_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def hard_hand_four_decks(sum, dealer_card)
  play = FourDecks.new
  play.hard_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, value|
        if dealer_key.include?(dealer_card)
          return action_value
        end
      end
    end
  end
end

def main
  start_program
  players_first_card = obtain_players_first_card
  players_second_card = obtain_players_second_card
  dealer_card = obtain_dealer_card
  deck_number = check_deck_number
  sum = players_first_card + players_second_card
  compare_player_cards(players_first_card, players_second_card, dealer_card, deck_number, sum)
end

main if __FILE__ == $PROGRAM_NAME
