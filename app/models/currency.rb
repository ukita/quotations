class Currency < ApplicationRecord
  enum code: { usd: 'Dollar', eur: 'Euro', btc: 'Bitcoin' }

  validates :code, inclusion: { in: codes.keys }

  # Returns name of the currency
  #
  # ==== Examples
  #
  #  currency = Currency.create(code: :usd)
  #  currency.name # => 'Dollar'
  def name
    Currency.codes[code]
  end
end
