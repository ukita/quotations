require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test 'should insert with valid data' do
    currency = Currency.new(name: 'Bitcoin', code: 'BTC')
    assert currency.save
  end

  test 'should validate presence of name' do
    currency = Currency.new(name: nil, code: 'USD')
    assert_not currency.save
  end

  test 'should validate presence of code' do
    currency = Currency.new(name: 'Dollar', code: nil)
    assert_not currency.save
  end

  test 'should validate uniqueness of code' do
    currency = Currency.new(name: 'Dollar', code: 'USD')
    assert_not currency.save
  end
end
