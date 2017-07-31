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
		@teams.each do |team|
			tag += content_tag(:li, "") do
				content_tag(:a, "", :href => "/teams/#{team.id}") do
					content_tag(:span, "", :class => balls[team.id % 20]) + 
					team.name
				end
			end
		end
		tag.html_safe
	end

	def reserve_modal(testline)
		content_tag(:div, "", :class => "modal", :id => testline.id) do
			content_tag(:div, "", :class => "modal-content") do
				form_for([testline, testline.reservations.build]) do |f|
					tag = content_tag(:div, "", :class => "modal-header") do
						content_tag(:button, '&times;'.html_safe, :class => "modal-close", :onclick => "deactivate_modal(#{testline.id})") +
						content_tag(:h3, testline.name, :class => "modal-title")
					end
					tag += content_tag(:div, "", :class => "modal-body") do
						content_tag(:label, "Title:") + 
						f.text_field(:name, :placeholder => "Title", :tabindex => 1, :required => true, :class => "form-control") +
						content_tag(:label, "Team Name:") + 
						f.text_field(:team_name, :value => @team.name, :tabindex => 2, :readonly => true, :required => true, :class => "form-control") +
						content_tag(:label, "Email:") + 
						f.email_field(:email, :value => current_user.email, :tabindex => 3, :readonly => true, :required => true, :class => "form-control") +
						content_tag(:label, "Description:") + 
						f.text_area(:description, :placeholder => "Title", :tabindex => 4, :required => true, :class => "form-control")
					end

					tag + content_tag(:div, "", :class => "modal-footer") do
						content_tag(:button, "Reserve now!", :class => "modal-btn", :type => "submit")
					end
				end
			end
		end
	end

	def img_modal(testline)
		content_tag(:div, "", :class => "modal", :id => "img-#{testline.id}") do
			content_tag(:button, '&times;'.html_safe, :class => "modal-close", :type => "button", :onclick => "deactivate_modal(\'img-#{testline.id}\')") +
			image_tag(testline.diagram, :class => "modal-img", :alt => "No diagram available")
		end
	end

	def desc_modal(testline)
		content_tag(:div, "", :class => "modal", :id => "desc-#{testline.id}") do
			content_tag(:div, "", :class => "modal-content") do
				content_tag(:div, "", :class => "modal-header") do
					content_tag(:button)
				end
			end
		end
	end

	def card_footer(testline)
		content_tag(:div, "", :class => "card-footer") do
			if user_signed_in?
				content_tag(:a, "Reserve now!", :href => "javascript:void(0)", 
					:class => "card-link", :onclick => "activate_modal(#{testline.id})")
			end
		end
	end

	def desc(text)
		if text.blank?
			return content_tag(:p, "No description available", :class => "modal-text")
		else
			return text.html_safe
		end
	end
end