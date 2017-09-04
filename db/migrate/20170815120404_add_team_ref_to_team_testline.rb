class AddTeamRefToTeamTestline < ActiveRecord::Migration
  def change
    add_reference :team_testlines, :team, index: true, foreign_key: true
  end
end
