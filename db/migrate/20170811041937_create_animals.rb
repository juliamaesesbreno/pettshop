class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :species
      t.string :breed
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
