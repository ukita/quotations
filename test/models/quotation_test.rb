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

  test 'should fetch quotations from today' do
    quotations = Quotation.from_today
    quotations.each do |quotation|
      assert quotation.created_at.to_date == Date.today
    end
  end

  test 'should fetch quotations from yesterday' do
    quotations = Quotation.from_yesterday
    quotations.each do |quotation|
      assert quotation.created_at.to_date == Date.yesterday
    end
  end

  test 'should fetch quotations from last week' do
    quotations = Quotation.from_last_week
    quotations.each do |quotation|
      assert last_week.cover?(quotation.created_at)
    end
  end

  test 'should fetch quotations from last month' do
    quotations = Quotation.from_last_month
    quotations.each do |quotation|
      assert last_month.cover?(quotation.created_at)
    end
  end

  test 'should group quotations by day' do
    quotations = Quotation.limit(5).group_by(&:group_by_day)
    quotations.each do |k,_|
      assert_nothing_raised do
        Date.parse(k)
      end
    end
  end

  private

  def last_week
    last_week = Date.today.last_week
    last_week...last_week.end_of_week
  end

  def last_month
    last_month = Date.today.last_month.beginning_of_month
    last_month...last_month.end_of_month
  end
end
