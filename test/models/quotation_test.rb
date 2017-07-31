require 'test_helper'

class QuotationTest < ActiveSupport::TestCase
  test 'should insert with valid data' do
    quotation = build_quotation
    assert quotation.save
  end

  test 'should validate presence of buy' do
    quotation = build_quotation(buy: nil)
    assert_not quotation.save
  end

  test 'should validate presence of sell' do
    quotation = build_quotation(sell: nil)
    assert_not quotation.save
  end

  test 'should validate presence of variation' do
    quotation = build_quotation(variation: nil)
    assert_not quotation.save
  end

  test 'should validate presence of currency' do
    quotation = build_quotation(currency: nil)
    assert_not quotation.save
  end

  def build_quotation(params = {})
    params = {
      currency: currencies(:usd),
      buy: 3.1561,
      sell: 3.1554,
      variation: 0.38
    }.merge(params)

    Quotation.new(params)
  end
end
