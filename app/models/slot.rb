class Slot < ApplicationRecord
  belongs_to :product
  has_many :bookings
end
