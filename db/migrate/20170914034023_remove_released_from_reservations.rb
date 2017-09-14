class RemoveReleasedFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :released, :boolean
  end
end
