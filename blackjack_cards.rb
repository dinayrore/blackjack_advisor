require 'pry'
#
class BlackjackCards
  attr_reader :value, :player_cards

  def initialize(value)
    @value = value
  end

  def check_player_card_values(player_card)
    if player_card == 'A'
      player_card = 11
      puts "Your card has a value of #{player_card}." "\n "

    else
      puts "Your card has a value of #{player_card}." "\n "
    end
  end

  def check_dealer_card_value(dealer_card)
    if dealer_card == 'A'
      dealer_card = 11
      puts "The dealer card has a value of #{dealer_card}." "\n "

    else
      puts "The dealer card has a value of #{dealer_card}." "\n "
    end
  end

  def open_deck(deck_number)
    if deck_number == 1
      OneDeck.new
    elsif deck_number == 2
      TwoDecks.new
    else
      FourDecks.new
    end

  end
end
