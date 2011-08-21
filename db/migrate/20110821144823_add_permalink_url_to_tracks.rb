class AddPermalinkUrlToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :permalink_url, :string
  end

  def self.down
    remove_column :tracks, :permalink_url
  end
end