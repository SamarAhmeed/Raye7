require 'rails_helper'

RSpec.describe Pickup, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:source).class_name('Place')}
  it {should belong_to(:destination).class_name('Place')}
end
