require 'pry'
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
  end

  players_first_card
end

def check_player_first_card_value(first_card)
  if first_card == 'A'
    first_card = 11

  else
    first_card = first_card.to_i
  end

  puts "Your first card has a value of #{first_card}." "\n "
  first_card
end

def obtain_players_second_card
  print 'Please enter your second card: '

  players_second_card = gets.chomp.upcase

  if ![*'2'..'10', 'A'].include?(players_second_card)
    obtain_players_second_card
  end

  players_second_card
end

def check_player_second_card_value(second_card)
  if second_card == 'A'
    second_card = 11

  else
    second_card = second_card.to_i
  end

  puts "Your second card has a value of #{second_card}." "\n "
  second_card
end

def obtain_dealer_card
  puts 'Remember to use \'10\' for face cards, and \'A\' for Aces.'
  print 'Please enter the dealer card: '

  dealer_card = gets.chomp.upcase

  if ![*'2'..'10', 'A'].include?(dealer_card)
    obtain_dealer_card
  end

  dealer_card
end

def check_dealer_card_value(dealer)
  if dealer == 'A'
    dealer = 11

  else
    dealer = dealer.to_i
  end

  puts "The dealer card has a value of #{dealer}." "\n "
  dealer
end

def check_deck_number
  puts 'So, how many decks are you playing with?'
  print "Please enter either \'1\', \'2\', or \'4\': "

  deck_number = gets.chomp.to_i

  if ![1, 2, 4].include?(deck_number)
    puts 'Invalid input. Try again.'
    check_deck_number
  end

  deck_number
end

def compare_player_cards(players_first_card, players_second_card, dealer, deck_number, sum)
  if players_first_card == players_second_card
    puts "So you're playing with pairs, huh..."
    search_for_pairs(deck_number, players_first_card, dealer)

  elsif players_first_card == 11 || players_second_card == 11
    puts "Alright, I can work with this! You're playing a soft hand..."
    search_soft_hand(deck_number, sum, dealer)

  else
    puts "Tough luck there bro. You're playing a hard hand..."
    search_hard_hand(deck_number, sum, dealer)
  end
end

def search_for_pairs(deck_number, player_card, dealer)
  if deck_number == 1
    puts pairs_one_deck(player_card, dealer)

  elsif deck_number == 2
    puts pairs_two_decks(player_card, dealer)

  else
    puts pairs_four_decks(player_card, dealer)
  end
end

def play_pairs(player_card, dealer, play)
  play.pairs.each do |player_key, value|
    if player_key.include?(player_card)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer)
          return action_value
        end
      end
    end
  end
end

def pairs_one_deck(player_card, dealer)
  play = OneDeck.new
  play_pairs(player_card, dealer, play)
end

def pairs_two_decks(player_card, dealer)
  play = TwoDecks.new
  play_pairs(player_card, dealer, play)
end

def pairs_four_decks(player_card, dealer)
  play = FourDecks.new
  play_pairs(player_card, dealer, play)
end

def search_soft_hand(deck_number, sum, dealer)
  if deck_number == 1
    puts soft_hand_one_deck(sum, dealer)

  elsif deck_number == 2
    puts soft_hand_two_decks(sum, dealer)

  else
    puts soft_hand_four_decks(sum, dealer)
  end
end

def play_soft_hand(sum, dealer, play)
  play.soft_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer)
          return action_value
        end
      end
    end
  end
end

def soft_hand_one_deck(sum, dealer)
  play = OneDeck.new
  play_soft_hand(sum, dealer, play)
end

def soft_hand_two_decks(sum, dealer)
  play = TwoDecks.new
  play_soft_hand(sum, dealer, play)
end

def soft_hand_four_decks(sum, dealer)
  play = FourDecks.new
  play_soft_hand(sum, dealer, play)
end

def search_hard_hand(deck_number, sum, dealer)
  if deck_number == 1
    puts hard_hand_one_deck(sum, dealer)

  elsif deck_number == 2
    puts hard_hand_two_decks(sum, dealer)

  else
    puts hard_hand_four_decks(sum, dealer)
  end
end

def play_hard_hand(sum, dealer, play)
  play.hard_hand.each do |player_key, value|
    if player_key.include?(sum)
      value.each do |dealer_key, action_value|
        if dealer_key.include?(dealer)
          return action_value
        end
      end
    end
  end
end

def hard_hand_one_deck(sum, dealer)
  play = OneDeck.new
  play_hard_hand(sum, dealer, play)
end

def hard_hand_two_decks(sum, dealer)
  play = TwoDecks.new
  play_hard_hand(sum, dealer, play)
end

def hard_hand_four_decks(sum, dealer)
  play = FourDecks.new
  play_hard_hand(sum, dealer, play)
end

def main
  start_program
  players_first_card = obtain_players_first_card
  first_card = check_player_first_card_value(players_first_card)
  players_second_card = obtain_players_second_card
  second_card = check_player_second_card_value(players_second_card)
  dealer_card = obtain_dealer_card
  dealer = check_dealer_card_value(dealer_card)
  deck_number = check_deck_number
  sum = first_card.to_i + second_card.to_i
  compare_player_cards(players_first_card, players_second_card, dealer, deck_number, sum)
end

main if __FILE__ == $PROGRAM_NAME
