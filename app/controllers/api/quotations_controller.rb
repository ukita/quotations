module Api
  class QuotationsController < ApplicationController
    before_action :set_currency

    def index
      @quotations = @currency.quotations.from_today
      render json: @quotations
    end

    def from_yesterday
      @quotations = @currency.quotations.from_yesterday
      render json: @quotations
    end

    def from_last_week
      @quotations = @currency.quotations.from_last_week

      @quotations = 
        @quotations
        .group_by(&:group_by_day)
        .sort
        .map {|k,v| v.max_by(&:created_at)}

      render json: @quotations
    end

    def from_last_month
      @quotations = @currency.quotations.from_last_month

      @quotations = 
        @quotations
        .group_by(&:group_by_day)
        .sort
        .map {|k,v| v.max_by(&:created_at)}

      render json: @quotations
    end

    private

    def set_currency
      @currency = Currency.find(params[:currency_id])
    end
  end
end
