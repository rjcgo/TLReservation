module TeamsHelper
	def available
		@mytestlines.each do |testline|
			if testline.reservations.count == 0 && !testline.isMaintenance?
				return true
			end
		end
		return false
	end

	def inUse
		@mytestlines.each do |testline|
			if testline.reservations.count != 0 && !testline.isMaintenance?
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

	def reserve_modal(testline)
		if !(testline.reservations.find_by email: current_user.email).nil?
			return ""
		end
		div_class = [
			"modal", 
			"modal-content",
			"modal-header",
			"modal-body",
			"modal-footer"
		]
		empty = ""
		label = [
			"Title:",
			"Team Name:",
			"Email:",
			"Description:"
		]
		placeholder = [
			"Test title",
			"Test description"
		]

		button_close = '&times;'.html_safe
		button_message = testline.reservations.empty? ? "Use now!" : "Reserve now!"

		button_class = [
			"modal-close",
			"modal-btn"
		]

		field_class = "form-control"

		h3_class = "modal-title"
		type = "submit"

		onclick = "deactivate_modal(#{testline.id})"

		content_tag(:div, :class => div_class[0], :id => testline.id) do
			content_tag(:div, :class => div_class[1]) do
				form_for([testline, testline.reservations.build]) do |f|
					tag = content_tag(:div, :class => div_class[2]) do
						content_tag(:button, button_close, :class => button_class[0], :onclick => onclick) +
						content_tag(:h3, testline.name, :class => h3_class)
					end
					tag += content_tag(:div, :class => div_class[3]) do
						content_tag(:label, label[0]) + 
						f.text_field(:name, :placeholder => placeholder[0], :tabindex => 1, :required => true, :class => field_class) +
						
						content_tag(:label, label[1]) + 
						f.text_field(:team_name, :value => @team.name, :tabindex => 2, :readonly => true, :required => true, :class => field_class) +
						
						content_tag(:label, label[2]) + 
						f.email_field(:email, :value => current_user.email, :tabindex => 3, :readonly => true, :required => true, :class => field_class) +
						
						content_tag(:label, label[3]) + 
						f.text_area(:description, :placeholder => placeholder[1], :tabindex => 4, :required => true, :class => field_class)
					end

					tag + content_tag(:div, :class => div_class[4]) do
						content_tag(:button, button_message, :class => button_class[1], :type => type)
					end
				end
			end
		end
	end

	def img_modal(testline)
		button = '&times;'.html_safe
		div_class = "modal"
		button_class = "modal-close"
		img_class = "modal-img"
		onclick = "deactivate_modal(\'img-#{testline.id}\')"
		type = "button"
		id = "img-#{testline.id}"
		alt = "No diagram available"
		src = testline.diagram.blank? ? "http://" : testline.diagram

		content_tag(:div, :class => div_class, :id => id) do
			content_tag(:button, button, :class => button_class, :type => type, :onclick => onclick) +
			image_tag(src, :class => img_class, :alt => alt, :title => testline.name)
		end
	end

	def card_footer(testline)
		message = testline.reservations.empty? ? "Use now!" : "Reserve now!"
		div_class = "card-footer"
		href = "javascript:void(0)"
		onclick = "activate_modal(#{testline.id})"
		a_class = "card-link"

		link = "Release"
		type = "button"
		link_class = "card-link text-red show-delete-modal"
		onclick2 = "if (ask_modal(-#{testline.id})) return; else {event.stopPropagation(); event.preventDefault();};"
		id = "-#{testline.id}"

		reserve = ""
		@reservations.each do |r|
			if r.testline_id == testline.id && r.email == current_user.email
				reserve = r
				break
			end
		end

		content_tag(:div, :class => div_class) do
			if user_signed_in?
				if (testline.reservations.find_by email: current_user.email).nil?
					content_tag(:a, message, :href => href, :class => a_class, :onclick => onclick)
				else
					link_to(link, testline, method: :delete, :class => link_class, :type => type, :onclick => onclick2, :id => id)
				end
			end
		end
	end

	def desc(text)
		return text.blank? ? content_tag(:p, "No description available", :class => "modal-text") : text.html_safe
	end

	def teams_notice
		content_tag(:div, '', :class => "notice-wrapper") do
    		content_tag(:h4, "There are no teams yet.")
	    end
	end 
end