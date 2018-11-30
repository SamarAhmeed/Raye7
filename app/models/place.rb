class Place < ApplicationRecord
    validates_uniqueness_of :name
    validates_uniqueness_of :longitude, :scope => :latitude
    has_many :source, :class_name => 'Trip', :foreign_key => 'source_id'
    has_many :destination, :class_name => 'Trip', :foreign_key => 'destination_id'
end
