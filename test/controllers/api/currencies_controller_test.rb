require 'test_helper'

module Api
  class CurrenciesControllerTest < ActionDispatch::IntegrationTest
    test 'should get all currencies' do
      get currencies_url
      assert_equal @response.body, Currency.all.to_json
    end
  end
end
