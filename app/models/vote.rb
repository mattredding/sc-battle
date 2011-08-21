class Vote < ActiveRecord::Base
  belongs_to :track
  validates_uniqueness_of :user_id, :scope => :battle_id
end