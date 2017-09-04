class RemoveTeamIdFromTeamTestline < ActiveRecord::Migration
  def change
    remove_column :team_testlines, :team_id, :integer
  end
end
