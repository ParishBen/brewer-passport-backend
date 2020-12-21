class DropFavoritelistsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :favoritelists
  end
end
