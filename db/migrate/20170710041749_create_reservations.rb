class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.boolean :released, default: false
      t.references :testline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
