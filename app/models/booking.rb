class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cd

  validates :start_time, :end_time, presence: true
end
