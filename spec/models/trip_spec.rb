require 'rails_helper'

RSpec.describe Trip, type: :model do
  it {should validate_numericality_of(:numberOfSeats).is_greater_than_or_equal_to(3)}
  it {should belong_to(:user)}
  it {should belong_to(:source).class_name('Place')}
  it {should belong_to(:destination).class_name('Place')}
end
