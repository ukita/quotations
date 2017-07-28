class Currency < ApplicationRecord
  has_many :quotations

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
