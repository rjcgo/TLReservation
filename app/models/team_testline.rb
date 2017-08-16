class TeamTestline < ActiveRecord::Base
	belongs_to :team
	belongs_to :testline
	validates_uniqueness_of :testline_id, :scope => :team_id
end
