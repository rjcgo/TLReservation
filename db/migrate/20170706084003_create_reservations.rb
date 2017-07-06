class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.timestamp :from
      t.timestamp :to
      t.string :team_name
      t.integer :tl_id

      t.timestamps
    end
  end
end
