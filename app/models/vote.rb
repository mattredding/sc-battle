class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => :battle_id
end