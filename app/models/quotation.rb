class Quotation < ApplicationRecord
  belongs_to :currency

  scope :from_today, -> { where('date(created_at) = ?', Date.current) }
  scope :from_yesterday, -> { where('date(created_at) = ?', 1.day.ago.to_date) }

  def self.from_last_week
    last_week = Date.today.last_week
    where(created_at: last_week...last_week.end_of_week)
  end

  def self.from_last_month
    last_month = Date.today.last_month.beginning_of_month
    where(created_at: last_month...last_month.end_of_month)
  end

  validates :buy, presence: true
  validates :sell, presence: true
  validates :variation, presence: true

  def group_by_day
    created_at.to_date.to_s(:db)
  end
end
