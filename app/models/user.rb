class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true,
            length: {in: 3..15}
  validates :password, length: {minimum: 6 }
end
