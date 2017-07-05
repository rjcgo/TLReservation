class CreateTestlines < ActiveRecord::Migration[5.1]
  def change
    create_table :testlines do |t|
      t.boolean :isAvailable

      t.timestamps
    end
  end
end
