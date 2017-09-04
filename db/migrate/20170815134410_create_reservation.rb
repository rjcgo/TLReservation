class CreateReservation < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.text :description
      t.boolean :released, default: false
      t.timestamp :start_time
      t.references :testline, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
