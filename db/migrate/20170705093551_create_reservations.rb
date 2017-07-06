class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.timestamp :check_in
      t.timestamp :check_out
      t.string :team
      t.integer :testline_id

      t.timestamps
    end
  end
end
