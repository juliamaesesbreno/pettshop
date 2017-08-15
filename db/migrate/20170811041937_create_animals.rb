class CreateAnimals < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
  end
end

  #def change
    #create_table :animals do |t|
      #t.string :species
      #t.string :breed
      #t.integer :price
      #t.string :status

      #t.timestamps
    #end
  #end
#end
