class Testline < ActiveRecord::Base
    has_many :reservations, -> { order(:created_at => :asc) }
	has_many :team_testlines
	has_many :teams, :through => :team_testlines
    validates :name, presence: true, uniqueness: true
    mount_uploader :diagram, DiagramUploader
end
