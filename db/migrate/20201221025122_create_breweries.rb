class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    drop_table :breweries do |t|
     

      t.timestamps
    end
  end
end
