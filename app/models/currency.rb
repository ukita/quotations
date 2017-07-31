class Currency < ApplicationRecord
  enum code: { usd: 'Dollar', eur: 'Euro', btc: 'Bitcoin' }

  validates :code, inclusion: { in: codes.keys }

  def name
    Currency.codes[code]
  end
end
