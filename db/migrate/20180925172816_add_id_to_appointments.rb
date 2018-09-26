class AddIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :user_id, :integer, default: 0
    add_column :appointments, :field_id, :integer
  end
end
