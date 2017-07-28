namespace :scheduler do
  desc 'This task will fetch quotations and store on database'
  task fetch_quotations: :environment do
    require 'open-uri'
    require 'json'

    api_key = Rails.application.secrets[:hg_finance_api_key]
    uri = "https://api.hgbrasil.com/finance/quotations?format=json&key=#{api_key}"

    request_data = JSON.parse(open(uri).read)

    if request_data['results']
      quotations = request_data['results']['currencies']

      Currency.all.each do |currency|
        if quotation = quotations[currency.code]
          currency.quotations.create(
            buy: quotation['buy'],
            sell: quotation['sell'],
            variation: quotation['variation']
          )
        end
      end
    end
  end
end
