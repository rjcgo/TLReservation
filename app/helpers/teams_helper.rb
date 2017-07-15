module TeamsHelper
	def available
		@mytestlines.each do |testline|
			if testline.reservations.count == 0
				return true
			end
		end
		return false
	end

	def inUse
		@mytestlines.each do |testline|
			if testline.reservations.count != 0
				return true
			end
		end
		return false
	end

	def maintenance
		@mytestlines.each do |testline|
			if testline.isMaintenance?
				return true
			end
		end
		return false
	end
end
