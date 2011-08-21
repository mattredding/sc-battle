class AddTrackIdToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :track_id, :integer
  end

  def self.down
    remove_column :votess, :track_id
  end
end