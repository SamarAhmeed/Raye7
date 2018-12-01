class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :phone_number
  validates :full_name, presence: true, length: {minimum: 6}, on: :create,on: :update, allow_nil: false
  has_many :trips
  has_many :pickups
end
