class CreateTestlines < ActiveRecord::Migration[5.1]
  def change
    create_table :testlines do |t|
      t.string :name

      t.timestamps
    end
  end
end
