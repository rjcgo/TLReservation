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

	def maintenance
		@testlines.each do |testline|
			if testline.isMaintenance?
				return true
			end
		end
		return false
	end

	def firstReserve
		@testlines.each do |testline|
			if testline.reservations.count != 0
				return testline.id
			end
		end
		return 0
	end
end
