class AddBattleIdToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :battle_id, :integer
  end

  def self.down
    remove_column :tracks, :battle_id
  end
end