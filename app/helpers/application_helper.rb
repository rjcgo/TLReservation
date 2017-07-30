module ApplicationHelper
	def card_body(testline)
        currentReserve = 0
        tag = ""
        content_tag(:u1, "") do
	        @reservations.each do |reserve| 
	            if testline.id == reserve.testline_id 
	                tag += content_tag(:li, "") do
	                	tag1 = content_tag(:p, reserve.team_name, :class => "card-text")
						if currentReserve == 0
							tag1 += content_tag(:small, "Current", :class => "badge badge-primary") 
						elsif currentReserve == 1 
							tag1 += content_tag(:small, "Next in Line", :class => "badge badge-next")
						else 
							tag1 += content_tag(:small, "Pending", :class => "badge badge-next")
						end 

						tag1 + content_tag(:button, "", :class => "delete-overlay show-delete-modal") do
							content_tag(:i, "", :class => "fa fa-calendar-check-o") + " #{reserve.email}"
	                	end
	                end
					currentReserve += 1
	            end 
	        end 
	        tag.html_safe
	    end
    end
end
