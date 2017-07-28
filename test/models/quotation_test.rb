require 'test_helper'

class QuotationTest < ActiveSupport::TestCase
  def build_quotation(params = {})
    params = {
      currency: currencies(:usd),
      buy: 3.1561,
      sell: 3.1554,
      variation: 0.38
    }.merge(params)

    Quotation.new(params)
  end

  test 'should insert with valid data' do
    currency = build_quotation
    assert currency.save
  end

  test 'should validate presence of buy' do
    currency = build_quotation(buy: nil)
    assert_not currency.save
  end

  test 'should validate presence of sell' do
    currency = build_quotation(sell: nil)
    assert_not currency.save
  end

  test 'should validate presence of variation' do
    currency = build_quotation(variation: nil)
    assert_not currency.save
  end
end
