class AddFieldsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :team_name, :string
    add_column :reservations, :description, :text
  end
end
