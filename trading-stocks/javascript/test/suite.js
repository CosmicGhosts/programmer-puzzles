import describe from 'tape-bdd'
import trading_stocks from '../src'

const fixtures = () => {
  let stocks = []
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

describe('Module: Trading Stocks', (it) => {
  it('throws error', (expect) => {
    expect.throws(() => trading_stocks([100]), /You need at least two entries./)
  })

  it('return Num of max profit', (expect) => {
    expect.equal(trading_stocks(fixtures()), 400)
  })
})
