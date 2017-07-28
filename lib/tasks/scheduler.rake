namespace :scheduler do
  desc 'This task will fetch quotations and store on database'
  task fetch_quotations: :environment do
    require 'net/http'
    require 'json'

    currencies = Currency.all()
    api_key = Rails.application.secrets[:hg_finance_api_key]
    uri = URI("https://api.hgbrasil.com/finance/quotations?format=json&#{api_key}")
    response = Net::HTTP.get(uri)

    quotations = JSON.parse(response)['results']['currencies']

    currencies.each do |currency|
      quotation = quotations[currency.code]
      next unless quotation

      currency.quotations.create(
        buy: quotation['buy'],
        sell: quotation['sell'],
        variation: quotation['variation']
      )
    end
  end
end
