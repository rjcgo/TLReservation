class CreateTeamTestlines < ActiveRecord::Migration
  def change
    create_table :team_testlines do |t|
      t.integer :team_id
      t.integer :testline_id

      t.timestamps null: false
    end
  end
end
