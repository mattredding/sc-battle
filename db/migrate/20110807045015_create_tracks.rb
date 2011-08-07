class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :soundcloud_track_id
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
