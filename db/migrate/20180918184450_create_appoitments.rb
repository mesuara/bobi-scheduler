class CreateAppoitments < ActiveRecord::Migration[5.2]
  def change
    create_table :appoitments do |t|
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :field_id
      t.boolean :free, default: true
      t.timestamps
    end
  end
end
