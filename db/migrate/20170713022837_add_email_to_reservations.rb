class AddEmailToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :email, :email
  end
end
