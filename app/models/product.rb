class Product < ApplicationRecord
  has_many :reserve_or_purchases, dependent: :destroy
  belongs_to :supplier
end
