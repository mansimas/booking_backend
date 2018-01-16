class Rental < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates_presence_of :name, :daily_rate
end
