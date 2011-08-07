class CreateBattleUserJoinTable < ActiveRecord::Migration
  def self.up
      create_table :battles_users, :id => false do |t|
        t.integer :battle_id
        t.integer :sc_user_id
      end
  end

  def self.down
    drop_table:battle_users
  end
end