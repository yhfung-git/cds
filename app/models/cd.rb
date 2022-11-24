class Cd < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  include PgSearch::Model

  validates :name, :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_then: 1 }

  pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
