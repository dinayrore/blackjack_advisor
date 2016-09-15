# method sums
# method for comparing
def is_numeric?
  is_float? || is_integer?
  return true
end

def compare_values_hard_hand(player, dealer)
  if player.first != 11 && player.last != 11 #you have a hard hand
    if ((player.first + player.last).between?(5, 7)) && (dealer.between?(2, 11)) ||
       ((player.first + player.last) == 8) && (dealer.between?(2, 4)) ||
       ((player.first + player.last) == 8) && (dealer.between?(7, 11)) ||
       ((player.first + player.last) == 9) && (dealer.between?(7, 11)) ||
       ((player.first + player.last) == 10) && (dealer.between?(10, 11)) ||
       ((player.first + player.last) == 12) && (dealer.between?(2, 3)) ||
       ((player.first + player.last) == 12) && (dealer.between?(7, 11)) ||
       ((player.first + player.last).between?(13, 16)) && (dealer.between?(7, 11))
      puts "You Better Hit!"
    end
  end
end

blackjack_hash = {}
other_card_values = [*"2".."10"]

puts "Greetings! I can help you optimize your gameplay in Blackjack. But I am going to need some input from you first."
puts "Please use the number value 10 for King, Queen, or Jack card faces, and the letter A for Ace."

puts "Please enter your first card: "
player_first_card = gets.chomp
if player_first_card == "A"
  player_first_card = 11
elsif other_card_values.include?(player_first_card)
  player_first_card = player_first_card.to_i
else
  puts "Please enter a valid value moron. Try again later."
  break
end

puts "Please enter your second card: "
player_second_card = gets.chomp.to_i
if player_second_card == "A"
  player_second_card = 11
elsif other_card_values.include?(player_second_card)
  player_second_card = player_second_card.to_i
else
  puts "Please enter a valid value moron. Try again later."
  break
end

blackjack_hash["player_cards"] = [player_first_card, player_second_card]

puts "Please enter dealers card: "
dealers_card = gets.chomp.to_i
if dealers_card == "A"
  dealers_card = 11
elsif other_card_values.include?(dealers_card)
  dealers_card = dealers_card.to_i
else
  puts "Please enter a valid value moron. Try again later."
  break
end

blackjack_hash["dealers_card"] = dealers_card

compare_values_hard_hand(blackjack_hash["player_cards"], blackjack_hash["dealer_card"])
