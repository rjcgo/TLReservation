module TestlinesHelper
	def available
		@testlines.each do |testline|
			if testline.reservations.count == 0
				return true
			end
		end
		return false
	end

	def inUse		
		@testlines.each do |testline|
			if testline.reservations.count != 0
				return true
			end
		end
		return false
	end

end
