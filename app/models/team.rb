class Team < ActiveRecord::Base
	has_many :team_testlines
	has_many :testlines, :through => :team_testlines
	validates :name, presence: true, uniqueness: true
end
