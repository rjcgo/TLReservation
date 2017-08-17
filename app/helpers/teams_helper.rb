module TeamsHelper

	def drop_down_teams(pokelist)
		balls = pokelist
		tag = ""
		empty = ""

		@teams.each do |team|
			tag += content_tag(:li) do
				content_tag(:a, :href => "/teams/#{team.id}") do
					content_tag(:span, empty, :class => balls[team.id % 20]) + 
					team.name
				end
			end
		end
		tag.html_safe
	end

	def teams_notice
		content_tag(:div, '', :class => "notice-wrapper") do
    		content_tag(:h4, "There are no teams yet.")
	    end
	end 

	def didReserveTestline(testline)
		userReservation = nil
		testline.reservations.each do |r|
			if r.user.email == current_user.email
				userReservation = r
				break
			end
		end
		return userReservation
	end
end