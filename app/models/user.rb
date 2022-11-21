class User < ApplicationRecord
  has_many :bookings
  has_many :cds

  # validates :first_name, :last_name, :address, presence: true
  validates :email, uniqueness: true, presence: true
  # validates :phone_number, numericality: { only_integer: true }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
