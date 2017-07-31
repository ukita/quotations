require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test 'should insert with valid data' do
    currency = build_currency
    assert currency.save
  end

  test 'should validate presence of code' do
    currency = build_currency(code: nil)
    assert_not currency.save
  end

  test 'should validate inclusion of code in codes' do
    assert_raises(ArgumentError) do
      build_currency(code: :something)
    end
  end

  test 'should validate uniqueness of code' do
    assert_raises(ActiveRecord::RecordNotUnique) do
      build_currency(code: :usd).save
    end
  end

  test 'should return currency name' do
    currency = currencies(:usd)
    assert_equal currency.name, 'Dollar'
  end

  def build_currency(params = {})
    params = {
      code: :btc
    }.merge(params)

    Currency.new(params)
  end
end
