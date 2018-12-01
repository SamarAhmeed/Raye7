class Trip < ApplicationRecord
  validates_numericality_of :numberOfSeats, :greater_than_or_equal_to => 3
  belongs_to :user
  belongs_to :source, :class_name => 'Place'
  belongs_to :destination, :class_name => 'Place'

  validate :time_cannot_be_in_the_past
  
  def time_cannot_be_in_the_past
    if time.present? && time < Time.now
      errors.add(:time, "can't be in the past")
    end
  end   
end
