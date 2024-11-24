class Customer < ApplicationRecord
  has_many :reserve_or_purchases
end
