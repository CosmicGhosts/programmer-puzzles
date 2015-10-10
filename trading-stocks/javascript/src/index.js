function fixtures() {
  var stocks = []
  stocks[0] = 200
  stocks[1] = 100
  stocks[2] = 300
  stocks[3] = 150
  stocks[4] = 125
  stocks[5] = 500
  stocks[6] = 90
  stocks[7] = 350
  stocks[8] = 450
  return stocks
}

function reduce_max_profit(data, current_price, index) {
  var min_price        = data.min_price
  var max_profit       = data.max_profit
  var potential_profit = current_price - min_price
  return {
    min_price:  Math.min(min_price,  current_price),
    max_profit: Math.max(max_profit, potential_profit)
  }
}

function get_max_profit(stock_prices) {
  var defaults = {
    min_price:  stock_prices[0],
    max_profit: stock_prices[1] - stock_prices[0]
  }

  return stock_prices
    .slice(1)
    .reduce(reduce_max_profit, defaults)
    .max_profit
}

(function main(stock_prices_yesterday) {
  if (stock_prices_yesterday.length < 2) {
    throw Error('You need at least two entries')
  }
  var max_profit = get_max_profit(stock_prices_yesterday)
  console.log(max_profit)
})(fixtures())
