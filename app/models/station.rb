class Station < ApplicationRecord
  require 'csv'
  #require 'activerecord-import/base'

  validates_presence_of    :identifier,
                           :name,
                           :address
                           :xcoord
                           :ycoord
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id


  #geocoded_by :address
  #after_validation :geocode, :if => :address_changed?
  
  attr_reader :identifier
  attr_reader :name
  attr_reader :docked_bikes
  attr_reader :xcoord
  attr_reader :ycoord
   
   
  attr_writer :name
  attr_writer :docked_bikes
  attr_writer :xcoord
  attr_writer :ycoord
  
  
end
 