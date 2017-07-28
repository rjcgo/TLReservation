class AddStartTimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :start_time, :timestamp
  end
end
