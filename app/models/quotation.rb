class Quotation < ApplicationRecord
  belongs_to :currency

  scope :create_between, -> range { where(created_at: range) }
  scope :from_today, -> { create_between(Date.current.all_day) }
  scope :from_yesterday, -> { create_between(1.day.ago.all_day) }
  scope :from_last_week, -> { create_between(Date.current.last_week.all_week) }
  scope :from_last_month, -> { create_between(Date.current.last_month.all_month) }

  validates :buy, presence: true
  validates :sell, presence: true
  validates :variation, presence: true

  def group_by_day
    created_at.to_date.to_s(:db)
  end
end
