class Reservation < ApplicationRecord
	# attr_accessible :check_in :check_out :team :testline_id
	belongs_to :testline
end
