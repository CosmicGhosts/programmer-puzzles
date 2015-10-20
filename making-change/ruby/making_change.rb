require 'pp'

def making_change (amount, coins)
  change_table = [0] * (amount + 1)
  change_table[0] = 1

  coins.each do |coin|
    (coin..amount).each do |higher_amount|
      remainder = higher_amount - coin
      change_table[higher_amount] += change_table[remainder]
    end
  end

  change_table[amount]
end

def main
  amount = 4
  denominations = [1, 2, 3]
  pp making_change amount, denominations
end

main
