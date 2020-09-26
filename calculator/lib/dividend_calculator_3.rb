class DividendCalculator3
  def self.yield_for_stock(stock)
    dividend_yield = dividend_yield_for_stock(stock)

    format('%<yield>.2f%%', yield: dividend_yield)
  end

  private_class_method def self.dividend_yield_for_stock(stock)
    payouts = payouts_for_stock(stock)

    total_payout = payouts.reduce(:+)

    total_payout / stock['price']
  end

  private_class_method def self.payouts_for_stock(stock)
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

puts DividendCalculator3.yield_for_stock(stock)
