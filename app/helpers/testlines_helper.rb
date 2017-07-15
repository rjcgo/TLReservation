module TestlinesHelper
	def firstReserve
		@testlines.each do |testline|
			if testline.reservations.count != 0
				return testline.id
			end
		end
		return 0
	end
end
