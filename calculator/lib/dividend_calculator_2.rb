class DividendCalculator2
  def self.yield_for_stock(stock)
    payouts = payouts_for_stock(stock)

    total_payout = payouts.reduce(:+)

    dividend_yield = total_payout / stock['price']

    format('%<yield>.2f%%', yield: dividend_yield)
  end

  private

  def self.payouts_for_stock(stock)
    if stock['payout_schedule'].eql? 'quarterly'
      stock['dividend_payments'].last(4)
    elsif stock['payout_schedule'].eql? 'monthly'
      stock['dividend_payments'].last(12)
    else
      stock['dividend_payments'].last(1)
    end
  end
end

stock = {
  'price' => 12.50,
  'payout_schedule' => 'quarterly',
  'dividend_payments' => [
    0.06,
    0.06,
    0.06,
    0.06,
    0.09,
    0.09,
    0.09,
    0.09,
    0.11,
    0.11,
    0.11,
    0.11,
    0.13,
    0.13,
    0.13,
    0.13
  ]
}

puts DividendCalculator2.yield_for_stock(stock)
