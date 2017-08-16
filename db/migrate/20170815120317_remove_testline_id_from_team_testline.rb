class RemoveTestlineIdFromTeamTestline < ActiveRecord::Migration
  def change
    remove_column :team_testlines, :testline_id, :integer
  end
end
