class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :soundcloud_uid
      t.string :soundcloud_username
      t.string :soundcloud_access_token
      t.string :soundcloud_expires_at
      t.string :soundcloud_refresh_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
