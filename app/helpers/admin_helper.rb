module AdminHelper
	def isActive(x, y)
		return x == y ? "active" : "";
	end

    def admin_notice(arr, option, notice)
    	div_class = "notice-wrapper"

    	tag1 = content_tag(:div, :class => div_class) do
	    	if !notice.blank?
	    		content_tag(:h4, notice)
	    	elsif arr.empty?
	    		content_tag(:h4, "There are no #{option} yet.")
	    	end
	    end
	    
	    !notice.blank? || arr.empty? ? tag1.html_safe : ""
	end

	def teams_without_access(testline)
		@noAccess = @teams - testline.teams
	end

	def header(page)
		icon = {
			"Users" => "fa fa-user-circle",
			"Teams" => "fa fa-users",
			"Testlines" => "fa fa-server",
			"Associations" => "fa fa-exchange"
		}
		return {:page => page, :icon => icon[page]}
	end

	def ball(id)
		return pokelist[id % 20]
	end
end