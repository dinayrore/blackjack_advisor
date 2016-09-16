require 'pry'
public
def between?(min, max)
  return true
end

def include?(value)
  return true
end

def is_numeric?
  is_float? || is_integer?
  return true
end

def compare_values_hard_hand(player, dealer) # something buggy here... says to hit when should say stand cannot figure out why...
  if player.first != 11 && player.last != 11 #you have a hard hand
    puts "Tough luck there bro. You're playing a hard hand..."
    if ((player.first + player.last).between?(5, 11)) && (dealer.between?(2, 11)) ||
       ((player.first + player.last).include?(12)) && (dealer.between?(2, 3)) ||
       ((player.first + player.last).include?(12)) && (dealer.between?(7, 11)) ||
       ((player.first + player.last).between?(13, 16)) && (dealer.between?(7, 11))
      puts "You Better Hit!"
    else
      puts "Stand"
    end
  end
end

def compare_values_soft_hand(player, dealer)
  if player.first == 11 || player.last == 11 #you have a soft hand
    puts "Alright, I can work with this. You're playing a soft hand..."
    if ((player.first + player.last).between?(13, 17)) && (dealer.between?(2, 11)) ||
       ((player.first + player.last).include?(18)) && (dealer.between?(9, 10))
      puts "You Better Hit!"
    else
      puts "Stand"
    end
  end
end

def compare_values_pairs(player, dealer)
  if player.first == player.last #you have a set of pairs
    puts "So you're playing with pairs, huh..."
    if (player.first.include?(2)) && (dealer.between?(8, 11)) ||
       (player.first.include?(3)) && (dealer.between?(9, 11)) ||
       (player.first.include?(4)) && (dealer.between?(2, 3)) ||
       (player.first.include?(4)) && (dealer.between?(7, 11)) ||
       (player.first.include?(5)) && (dealer.between?(2, 11)) ||
       (player.first.include?(6)) && (dealer.between?(8, 11)) ||
       (player.first.include?(7)) && (dealer.include?(9)) ||
       (player.first.include?(7)) && (dealer.include?(11))
      puts "You Better Hit!"
    elsif (player.first.include?(7)) && (dealer.include?(10)) ||
      (player.first.include?(9)) && (dealer.include?(7)) ||
      (player.first.include?(9)) && (dealer.between?(10, 11)) ||
      (player.first.include?(10)) && (dealer.between?(2, 11))
      puts "Stand"
    else
      puts "You should probably split that..."
    end
  end
end

blackjack_hash = {}
other_card_values = [*"2".."11"]

puts "Greetings! I can help you optimize your gameplay in Blackjack. But I am going to need some input from you first."
puts "Please use the number value 10 for King, Queen, or Jack face cards, and the letter A for Ace."

puts "Please enter your first card: "
player_first_card = gets.chomp
if player_first_card == "A"
  player_first_card = 11
elsif other_card_values.include?(player_first_card)
  player_first_card = player_first_card.to_i
else
  puts "Please enter a valid value. Try again later."
  exit
end

puts "Please enter your second card: "
player_second_card = gets.chomp
if player_second_card == "A"
  player_second_card = 11
elsif other_card_values.include?(player_second_card)
  player_second_card = player_second_card.to_i
else
  puts "Please enter a valid value. Try again later."
  exit
end

blackjack_hash["player_cards"] = [player_first_card, player_second_card]

puts "Please enter dealer's card: "
dealers_card = gets.chomp
if dealers_card == "A"
  dealers_card = 11
elsif other_card_values.include?(dealers_card)
  dealers_card = dealers_card.to_i
else
  puts "Please enter a valid value. Try again later."
  exit
end

blackjack_hash["dealers_card"] = dealers_card

compare_values_pairs(blackjack_hash["player_cards"], blackjack_hash["dealer_card"])
compare_values_hard_hand(blackjack_hash["player_cards"], blackjack_hash["dealer_card"])
compare_values_soft_hand(blackjack_hash["player_cards"], blackjack_hash["dealer_card"])
# reads both pairs and hard hand if values match up... how do I get it to only do one or the other...
