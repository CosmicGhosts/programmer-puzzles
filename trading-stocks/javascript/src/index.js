const max = Math.max
const min = Math.min

function reduce_max_profit (data, current_price) {
  var min_price        = data.min_price
  var max_profit       = data.max_profit
  var potential_profit = current_price - min_price

  return {
    min_price:  min(min_price,  current_price),
    max_profit: max(max_profit, potential_profit)
  }
}

function max_profit (stock_prices) {
  var defaults = {
    min_price:  stock_prices[0],
    max_profit: stock_prices[1] - stock_prices[0]
  }

  return stock_prices
    .slice(1)
    .reduce(reduce_max_profit, defaults)
    .max_profit
}

export default function (stock_prices_yesterday) {
  if (stock_prices_yesterday.length < 2) {
    throw new Error('You need at least two entries.')
  }

  return max_profit(stock_prices_yesterday)
}
