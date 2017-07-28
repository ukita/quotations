require 'test_helper'

module Api
  class QuotationsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @currency = currencies(:usd)
    end

    test 'should list all quotations from today' do
      get currency_quotations_url(currency_id: @currency)
      assert_equal response.body, @currency.quotations.from_today.to_json
    end

    test 'should list all quotations from yesterday' do
      get currency_quotations_from_yesterday_url(currency_id: @currency)
      assert_equal response.body, @currency.quotations.from_yesterday.to_json
    end

    test 'should list all quotations from last week' do
      get currency_quotations_from_last_week_url(currency_id: @currency)
      assert_equal response.body, @currency.quotations.from_last_week.to_json
    end

    test 'should list all quotations from last month' do
      get currency_quotations_from_last_month_url(currency_id: @currency)
      assert_equal response.body, @currency.quotations.from_last_month.to_json
    end
  end
end
