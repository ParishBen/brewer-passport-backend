class DropWishlistsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :wishlists
  end
end
