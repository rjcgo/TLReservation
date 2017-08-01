module ApplicationHelper
	def card_body(testline)
        currentReserve = 0
        tag = ""
        tag2 = ""
        content_tag(:div, :class => "card-body") do
	        tag2 = content_tag(:ul, "") do
		        @reservations.each do |reserve| 
		            if testline.id == reserve.testline_id 
		            	if currentReserve < 4
			                tag += content_tag(:li, "") do
			                	tag1 = content_tag(:p, reserve.team_name.html_safe, :class => "card-text")
								if currentReserve == 0
									tag1 += content_tag(:small, "Current", :class => "badge badge-primary") 
								elsif currentReserve == 1 
									tag1 += content_tag(:small, "Next in Line", :class => "badge badge-next")
								elsif currentReserve == 2 || currentReserve == 3
									tag1 += content_tag(:small, "Pending", :class => "badge badge-next")
								end 
									
								tag1 + content_tag(:span, "", :class => "delete-overlay") do
									content_tag(:i, "", :class => "fa fa-calendar-check-o") + " #{reserve.email}"
			                	end
			                end
			            end
						currentReserve += 1
		            end 
				end
				tag.html_safe
		    end
			if currentReserve == 0
				tag2 += content_tag(:p, "There is currently no reservations for this testline.", :style => "text-align: center;")
			end
			tag2.html_safe
	    end
    end

	def card_header(testline)
		if testline.isMaintenance?
			stat = "maintenance"
		elsif testline.reservations.count != 0
			stat = "inUse"
		else
			stat = "available"
		end
		
		tag = ""
		color = {"available" => "green", "maintenance" => "yellow", "inUse" => "red"}
		symbol = {"available" => "check", "maintenance" => "exclamation-triangle", "inUse" => "times"}
		
		content_tag(:div, "", :class => "card-header bg-blue") do
			tag = content_tag(:div, "", :class => "status-circle bg-#{color[stat]}") do
				content_tag(:i, "", :class => "fa fa-#{symbol[stat]} fa-white")
			end
			tag += content_tag(:i, "", :class => "fa fa-server testline-icon text-white")
			tag + content_tag(:div, "", :class => "card-header-overlay") do
				content_tag(:h3, testline.name, :class => 'card-title') +
				content_tag(:a, 'Show Diagram', :href => "javascript:void(0)", :class => 'card-header-link show-img-modal', :onclick => "activate_modal(\'img-#{testline.id}\')") +
				tag(:br) +
				content_tag(:a, 'Show Description', :href => "javascript:void(0)", :class => 'card-header-link show-description-modal', :onclick => "activate_modal(\'desc-#{testline.id}\')")
			end
		end
	end
end
