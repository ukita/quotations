class Quotation < ApplicationRecord
  belongs_to :currency

  validates :buy, presence: true
  validates :sell, presence: true
  validates :variation, presence: true
end
