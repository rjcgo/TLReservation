class AddTestlineRefToTeamTestline < ActiveRecord::Migration
  def change
    add_reference :team_testlines, :testline, index: true, foreign_key: true
  end
end
