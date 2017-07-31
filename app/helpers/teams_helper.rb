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
						f.text_field(:team_name, :value => @team.name, :tabindex => 2, :required => true, :class => "form-control") +
						content_tag(:label, "Email:") + 
						f.email_field(:email, :value => current_user.email, :tabindex => 3, :required => true, :class => "form-control") +
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

	def card_header_content(testline)
		content_tag(:h3, testline.name) +
		content_tag(:a, 'Show Diagram', :href => "javascript:void(0)", :class => 'show-diagram show-img-modal', :onclick => "activate_modal(\'img-#{testline.id}\')") +
		tag(:br) +
		content_tag(:a, 'Show Description', :href => "javascript:void(0)", :class => 'show-description show-description-modal', :onclick => "activate_modal(\'desc-#{testline.id}\')")
	end

	def modal_img(testline)
		content_tag(:div, "", :class => "modal", :id => "img-#{testline.id}") do
			content_tag(:button, '&times;'.html_safe, :class => "modal-close", :type => "button", :onclick => "deactivate_modal(\'img-#{testline.id}\')") +
			image_tag("long-html-img.jpg", :class => "modal-img", :alt => "long-html-img.jpg")
		end
	end
end