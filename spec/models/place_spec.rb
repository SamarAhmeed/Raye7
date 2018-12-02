require 'rails_helper'

RSpec.describe Place, type: :model do
    
  context 'validation tests' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:latitude)}
    it {should validate_presence_of(:longitude)}
    it {should validate_uniqueness_of(:name)}
    it {should validate_uniqueness_of(:longitude).scoped_to(:latitude)}
    # it {should have_many(:source).class_name('Pickup')}
    it {should have_many(:source).class_name('Trip')}
    # it {should have_many(:destination).class_name('Pickup')}
    it {should have_many(:destination).class_name('Trip')}
    
    # it 'ensures name is resence' do
    #   place= Place.new(longitude: 5 ,latitude: 6).save
    #   expect(place).to eq(false)
    # end
    
    # it 'ensures longitude is presence' do
    #   place= Place.new(name: 'ahmed' ,latitude: 6).save
    #   expect(place).to eq(false)
    # end
    # it 'ensures latitude is presence' do
    #   place= Place.new(name: 'ahmed' ,longitude: 6).save
    #   expect(place).to eq(false)
    # end
    # it 'ensures name is unique' do
    #   place= Place.new(name: 'ahmed',longitude: 5 ,latitude: 6).save
    #   place2= Place.new(name: 'ahmed',longitude: 5 ,latitude: 7).save
    #   expect(place2).to eq(false)
    # end
    # it 'ensures longitude and latitude are unique together' do
    #   place= Place.new(name: 'ahmed',longitude: 5 ,latitude: 6).save
    #   place2= Place.new(name: 'ahmed2',longitude: 5 ,latitude: 6).save
    #   expect(place2).to eq(false)
    # end
    # it 'happy case sinario ' do
    #   place= Place.new(name: 'ahmed',longitude: 5 ,latitude: 6).save
    #   place2= Place.new(name: 'ahmed2',longitude: 5 ,latitude: 7).save
    #   expect(place2).to eq(true)
    # end
end
end
