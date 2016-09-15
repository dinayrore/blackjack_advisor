blackjack_hash = {}

K || Q || J = 10
A = 1 || 11

puts "Greetings! I am willing to help you optimize your gameplay in Blackjack, but I am going to need some input from you first!"

puts "Please enter your first card: "
player_first_card = gets.chomp.to_i

puts "Please enter your second card: "
player_second_card = gets.chomp.to_i

blackjack_hash["player_cards"] = [player_first_card, player_second_card]

puts "Please enter dealers card: "
dealer_card = gets.chomp.to_i

blackjack_hash["dealer_card_arr"] = dealer_card
