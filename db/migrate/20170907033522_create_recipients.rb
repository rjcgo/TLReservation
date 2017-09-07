class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :email
      t.references :reservation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
