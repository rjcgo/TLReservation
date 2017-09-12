class Team < ActiveRecord::Base
	has_many :users
	has_many :reservations
	has_many :team_testlines
	has_many :testlines, :through => :team_testlines
	validates :name, presence: true, uniqueness: true
end
