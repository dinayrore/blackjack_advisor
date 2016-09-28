# this class was created for Blackjack gameplay using one deck.
class OneDeck
  def hard_hand
    { [*5..7] => { [*2..11] => 'Hit!' },
      8 => { [*2..4, *7..11] => 'Hit!', [5, 6] => 'Double or Hit!' },
      9 => { [*2..6] => 'Double or Hit!', [*7..11] => 'Hit!' },
      10 => { [*2..9] => 'Double or Hit!', %w(10 11) => 'Hit!' },
      11 => { [*2..11] => 'Double or Hit!' },
      12 => { [2, 3, *7..11] => 'Hit!', [*4..6] => 'Stand.' },
      [*13..16] => { [*2..6] => 'Stand.', [*7..11] => 'Hit!' },
      [*17..21] => { [*2..11] => 'Stand.' } }
  end

  def soft_hand
    { [*13..16] => { [%w(2 3), *7..11] => 'Hit!', [*4..6] => 'Double or Hit!' },
      17 => { [*2..6] => 'Double or Hit!', [*7..11] => 'Hit!' },
      18 => { %w(2 7 8 11) => 'Stand.', [*3..6] => 'Double or Stand.', %w(9 10) => 'Hit!' },
      19 => { [*2..5, *7..11] => 'Stand.', %w(6) => 'Double or Stand.' },
      %w(20 21) => { [*2..11] => 'Stand.' } }
  end

  def pairs
    { 2 => { [*2..7] => 'Split!', [*8..11] => 'Hit!' },
      3 => { [*2..8] => 'Split!', [*9..11] => 'Hit!' },
      4 => { [2, 3, *7..11] => 'Hit!', [*4..6] => 'Split!' },
      5 => { [*2..9] => 'Double or Hit!', %w(10 11) => 'Hit!' },
      6 => { [*2..7] => 'Split!', [*8..11] => 'Hit!' },
      7 => { [*2..8] => 'Split!', %w(9 11) => 'Hit!', %w(10) => 'Stand.' },
      %w(8 11) => { [*2..11] => 'Split!' },
      9 => { [*2..6, 8, 9] => 'Split!', %w(7 10 11) => 'Stand.' },
      10 => { [*2..11] => 'Stand.' } }
  end
end
