class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :name
      t.text :description
      t.datetime :open
      t.datetime :close
      t.string :street
      t.string :city
      t.string :state 
      t.integer :zip 

      t.timestamps
    end
  end
end
