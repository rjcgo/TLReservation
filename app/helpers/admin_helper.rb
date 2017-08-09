module AdminHelper
	def isActive(x, y)
		return x == y ? "active" : "";
	end

	def button_add_association(id)
		button_class = "add-rel show-rel-modal"
		onclick = "activate_modal(#{id});"
		i_class = "fa fa-plus"
		add_team = " Add Team"
		empty = ""

		content_tag(:button, :class => button_class, :onclick => onclick) do
			content_tag(:i, empty, :class => i_class) + add_team
		end
	end

	def show_associations_teams(testline)
		balls = pokelist
		tag = ""
		empty = ""
		notice_tag = content_tag(:p, "No team can currently use this testline.", :style => "text-align: center;")
		
		div_class = "outer-border-hidden"
		ul_class = "pokeballs-grid pokeballs-grid-sm"

		button_class = "release show-delete-modal"
		i_class = "fa fa-times"


		tag1 = content_tag(:div, :class => div_class) do
			content_tag(:ul, :class => ul_class) do
				@teams.each do |team|
			        @team_testlines.each do |team_testline|
			        	if team_testline.testline_id == testline.id && team.id == team_testline.team_id
			            	tag << content_tag(:li) do
			            		tag_form = {:onsubmit => "return ask_modal(-#{team_testline.id});"}
			                	tag2 = button_to(team_testline, method: :delete, :class => button_class, :type => "button", form: tag_form, :id => -team_testline.id) do
			                		content_tag(:i, empty, :class => i_class)
			                	end
			                	tag2 + content_tag(:span, empty, :class => balls[team.id % 20]) << team.name
			                end
			           	end
			        end
			    end
			    tag.html_safe
			end
		end

		return tag.blank? ? notice_tag : tag1.html_safe
	end

	def option_testline(testline)
		div_class = "card-footer"

		a = "Edit Testline"
		a_class = "card-link"
		href = "/testlines/#{testline.id}/edit"

		link = "Delete"
		type = "button"
		link_class = "card-link text-red show-delete-modal"
		onclick = "if (ask_modal(-#{testline.id})) return; else {event.stopPropagation(); event.preventDefault();};"
		id = "-#{testline.id}"
		
		content_tag(:div, :class => div_class) do
			content_tag(:a, a, :href => href, :class => a_class) +
			link_to(link, testline, method: :delete, :class => link_class, :type => type, :onclick => onclick, :id => id)
	    end
    end

    def admin_notice(arr, option, notice)
    	tag2 = ""
    	empty = ""
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
		balls = pokelist
		tag = ""
		empty = ""
		type = "submit"
		button_class = "pokeballs-item"

		@teams.each do |team|
			if not TeamTestline.exists?(team_id: team.id, testline_id: testline.id)
				tag << content_tag(:li) do
					form_for(@team_testline) do |f|
						f.hidden_field(:team_id, :value => team.id) +
						f.hidden_field(:testline_id, :value => testline.id) +
						content_tag(:button, :type => type, :class => button_class) do
							content_tag(:span, empty, :class => balls[team.id % 20]) + team.name
						end
					end
				end
			end
		end
		tag.html_safe
	end

	def user_btn(user)
		button_class = "make-admin-btn"
		type = "button"
		form = {:onsubmit => "return ask_modal(-#{user.id});"}
		id = "-#{user.id}"

		i_class = "fa fa-lock"
		empty = ""
		mes = " Make Admin"

    	button_to(admin_makeAdmin_path(user), method: :post, :class => button_class, :type => type, form: form, :id => id) do
    		content_tag(:i, empty, :class => i_class) +
    		mes
    	end
	end
end