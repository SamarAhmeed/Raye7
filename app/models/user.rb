class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :phone_number
  #validates :full_name, on: :create,on: :update
  validates_presence_of :full_name
  validates_length_of :full_name ,minimum: 6
  has_many :trips, dependent: :destroy 
  has_many :pickups, dependent: :destroy 
end
