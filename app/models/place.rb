class Place < ApplicationRecord
    validates :name ,presence: true
    validates_uniqueness_of :name
    validates_uniqueness_of :longitude, :scope => :latitude
    validates :longitude ,presence: true
    validates :latitude , presence: true
    
    has_many :source, :class_name => 'Pickup', :foreign_key => 'source_id'
    has_many :destination, :class_name => 'Pickup', :foreign_key => 'destination_id'
    has_many :source, :class_name => 'Trip', :foreign_key => 'source_id'
    has_many :destination, :class_name => 'Trip', :foreign_key => 'destination_id'
   
end
