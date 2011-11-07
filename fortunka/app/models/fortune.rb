class Fortune < ActiveRecord::Base
  validates :body, :presence => true
  validates_length_of :body, :in => 2..70
  validates_length_of :source, :in => 2..30
  
  
end