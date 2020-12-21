class CreateFavoritelists < ActiveRecord::Migration[6.0]
  def change
    create_table :favoritelists do |t|
      t.string :city
      t.string :address
      t.string :name
      t.string :state
      t.string :country
      t.string :description
      t.string :website
      t.string :phoneNum
      t.integer :user_id

      t.timestamps
    end
  end
end
