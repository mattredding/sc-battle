class Battle < ActiveRecord::Base
  has_many :tracks
  # has_many :users :through => :tracks  
end