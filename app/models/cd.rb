class Cd < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_then: 1 }
end
