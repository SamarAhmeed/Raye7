require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
      # it 'ensures full name presence' do
      #  # user = User.new(full_name: 'ahmedas',phone_number: '01124234324' , role: 'driver',email: 'sample@example.com',password: '123456',password_confirmation: '123456' ).save
      #  user = User.new(email: 'sample@example.com',password: '123456',password_confirmation: '123456' ).save 
      #  expect(user).to eq(true)
      # end
      # it 'ensures full name presence 2' do
      #   user = User.new(email: 'sample@example.com',password: '1235456',password_confirmation: '123456' ).save
      #   expect(user).to eq(false)
      # end
      it {should validate_uniqueness_of(:phone_number)}
      it {should have_many(:trips).dependent(:destroy) }
      it {should have_many(:pickups).dependent(:destroy) }
      it {should validate_presence_of(:full_name)}
      it {should validate_length_of(:full_name).is_at_least(6)}
  end
end
