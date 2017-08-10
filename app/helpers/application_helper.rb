module ApplicationHelper
	def card_body(testline)
        pos = 0
        tag = ""
        tag2 = ""
        empty = ""

        small = ["Current", "Next in Line", "Pending", "Pending"]
        small_class = ["badge badge-primary", "badge badge-next", "badge badge-pending", "badge badge-pending"]
        span_class = "delete-overlay"
        i_class = "fa fa-calendar-check-o"
        p_class = "card-text"
        div_class = "card-body"

        content_tag(:div, :class => div_class) do
	        tag2 = content_tag(:ul) do
		        @reservations.each do |reserve| 
		            if testline.id == reserve.testline_id 
		            	if pos < 4
			                tag += content_tag(:li) do
			                	content_tag(:p, reserve.team_name.html_safe, :class => p_class) +
								content_tag(:small, small[pos], :class => small_class[pos]) +	
								content_tag(:span, :class => span_class) do
									content_tag(:i, empty, :class => i_class) + 
									" #{reserve.email}"
			                	end
			                end
			            end
						pos += 1
		            end 
				end
				tag.html_safe
		    end
			if pos == 0
				tag2 += content_tag(:p, "There are currently no reservations for this testline.", :style => "text-align: center;")
			end
			tag2.html_safe
	    end
    end

	def card_header(testline)
		if testline.isMaintenance?
			color, symbol = ["yellow", "exclamation-triangle"]
		elsif testline.reservations.count != 0
			color, symbol = ["red", "times"]
		else
			color, symbol = ["green", "check"]
		end
		
		tag1 = ""
		
		div_class = ["card-header bg-blue", "status-circle bg-#{color}", "card-header-overlay"]
		i_class = ["fa fa-#{symbol} fa-white", "fa fa-server testline-icon text-white"]
		h3_class = "card-title"
		a_class = ["card-header-link show-img-modal", "card-header-link show-description-modal"]
		onclick = ["activate_modal(\'img-#{testline.id}\')", "activate_modal(\'desc-#{testline.id}\')"]

		a = ["Show Diagram", "Show Description"]

		href = "javascript:void(0)"

		empty = ""

		content_tag(:div, :class => div_class[0]) do
			tag1 = content_tag(:div, :class => div_class[1]) do
				content_tag(:i, empty, :class => i_class[0])
			end
			tag1 += content_tag(:i, empty, :class => i_class)
			tag1 + content_tag(:div, :class => div_class[2]) do
				content_tag(:h3, testline.name, :class => h3_class) +
				content_tag(:a, a[0], :href => href, :class => a_class[0], :onclick => onclick[0]) +
				tag(:br) +
				content_tag(:a, a[1], :href => href, :class => a_class[1], :onclick => onclick[1])
			end
		end
	end

	def testlines_info(testlines)
		tag = ""
		testlines.each do |testline|
			tag += render(partial: 'description', locals: {:testline => testline})
        	tag += img_modal(testline)
        end
        tag.html_safe
    end
end
