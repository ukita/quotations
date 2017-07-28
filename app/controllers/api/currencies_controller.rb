module Api
  class CurrenciesController < ApplicationController
    def index
      @currencies = Currency.all
      render json: @currencies
    end
  end
end
