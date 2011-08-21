class AddPermalinkToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :permalink, :string
  end

  def self.down
    remove_column :tracks, :permalink
  end
end