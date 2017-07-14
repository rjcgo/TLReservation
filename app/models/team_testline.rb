class TeamTestline < ActiveRecord::Base
	validates_uniqueness_of :testline_id, :scope => :team_id
end
