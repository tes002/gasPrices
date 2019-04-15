class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :latitude, presence: false
  validates :longitude, presence: false
end
