# this class was created for Blackjack gameplay using four decks.
class FourDecks
  def hard_hand
    { [*5..8] => { [*2..11] => 'Hit!' },
      9 => { [2, *7..11] => 'Hit!', [*3..6] => 'Double or Hit!' },
      10 => { [*2..9] => 'Double or Hit!', %w(10 11) => 'Hit!' },
      11 => { [*2..10] => 'Double or Hit!', %w(11) => 'Hit!' },
      12 => { [2, 3, *7..11] => 'Hit!', [*4..6] => 'Stand.' },
      [*13..16] => { [*2..6] => 'Stand.', [*7..11] => 'Hit!' },
      [*17..21] => { [*2..11] => 'Stand.' } }
  end

  def soft_hand
    { %w(13 14) => { [*2..4, *7..11] => 'Hit!', %w(5 6) => 'Double or Hit!' },
      %w(15 16) => { [2, 3, *7..11] => 'Hit!', [*4..6] => 'Double or Hit!' },
      17 => { [2, *7..11] => 'Hit!', [*3..6] => 'Double or Hit!' },
      18 => { %w(2 7 8) => 'Stand.', [*3..6] => 'Double or Stand.', [*9..11] => 'Hit!' },
      [*19..21] => { [*2..11] => 'Stand.' } }
  end

  def pairs
    { %w(2 3) => { [*2..7] => 'Split!', [*8..11] => 'Hit!' },
      4 => { [*2..4, *7..11] => 'Hit!', %w(5 6) => 'Split!' },
      5 => { [*2..9] => 'Double or Hit!', %w(10 11) => 'Hit!' },
      6 => { [*2..6] => 'Split!', [*7..11] => 'Hit!' },
      7 => { [*2..7] => 'Split!', [*8..11] => 'Hit!' },
      %w(8 11) => { [*2..11] => 'Split!' },
      9 => { [*2..6, 8, 9] => 'Split!', %w(7 10 11) => 'Stand.' },
      10 => { [*2..11] => 'Stand.' } }
  end
end
