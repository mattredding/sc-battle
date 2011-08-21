class Track < ActiveRecord::Base
  belongs_to :user
  belongs_to :battle
  has_many :votes
end