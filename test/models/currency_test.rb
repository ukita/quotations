require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  def build_currency(params = {})
    params = {
      name: 'Bitcoin',
      code: 'BTC'
    }.merge(params)

    Currency.new(params)
  end

  test 'should insert with valid data' do
    currency = build_currency
    assert currency.save
  end

  test 'should validate presence of name' do
    currency = build_currency(name: nil)
    assert_not currency.save
  end

  test 'should validate presence of code' do
    currency = build_currency(code: nil)
    assert_not currency.save
  end

  test 'should validate uniqueness of code' do
    currency = build_currency(code: 'USD')
    assert_not currency.save
  end
end
