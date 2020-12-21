class DropBreweries < ActiveRecord::Migration[6.0]
  def change
    drop_table :breweries
  end
end
