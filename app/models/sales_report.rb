class SalesReport < ApplicationRecord
  belongs_to :product

  validates :report_date, presence: true
  validates :daily_earnings, numericality: { greater_than_or_equal_to: 0 }
  validates :products_sold_quantity, numericality: { greater_than_or_equal_to: 0 }
end
