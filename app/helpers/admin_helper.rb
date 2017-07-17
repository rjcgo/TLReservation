module AdminHelper
	def isActive(sect,sect_act)
		if sect_act == sect
			return "tablinks active"
		else
			return "tablinks"
		end
	end
end
