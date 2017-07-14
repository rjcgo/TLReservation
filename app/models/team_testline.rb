class TeamTestline < ActiveRecord::Base
	validates :testline_id, presence: true
	validates :team_id, presence: true
	validates_uniqueness_of :testline_id, :scope => :team_id
end
