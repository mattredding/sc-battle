class AddScColsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :soundcloud_username, :string
    add_column :users, :soundcloud_access_token, :string
    add_column :users, :soundcloud_refresh_token, :string
    add_column :users, :soundcloud_expires_at, :string
  end

  def self.down
    remove_column :users, :soundcloud_expires_at
    remove_column :users, :soundcloud_refresh_token
    remove_column :users, :soundcloud_access_token
    remove_column :users, :soundcloud_username
  end
end
