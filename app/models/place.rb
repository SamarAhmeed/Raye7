class Place < ApplicationRecord
    validates_uniqueness_of :name
    validates_uniqueness_of :longitude, :scope => :latitude
end
