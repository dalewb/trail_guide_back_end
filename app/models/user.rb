class User < ApplicationRecord
  has_many :bookings
  has_many :locations, through: :bookings
  has_many :posts
  has_many :commodities, through: :posts
end
