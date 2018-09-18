class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :name
      t.text :description
      t.time :open
      t.time :close
      t.string :street
      t.string :city
      t.string :state 
      t.integer :zip 

      t.timestamps
    end
  end
end
