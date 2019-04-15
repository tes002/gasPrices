class GasStation < ApplicationRecord
  validates :name, presence: false
  validates :address, presence: false
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :price, presence: true
end
