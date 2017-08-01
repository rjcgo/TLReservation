module AdminHelper
	def isActive(sect,sect_act)
		if sect_act == sect
			return "tablinks active"
		else
			return "tablinks"
		end
	end

	def button_add_association(id)
		content_tag :button, "", :class => "add-rel show-rel-modal", :onclick => "activate_modal(#{id})" do
			content_tag(:i, "", :class => "fa fa-plus") + " Add Team"	
		end
	end

	def show_associations_teams(testline)
		balls = pokelist
		tag = ""
		tag1 = content_tag(:div, "", :class => "outer-border-hidden") do
			content_tag(:ul, "", :class => "pokeballs-grid pokeballs-grid-sm") do
				@teams.each do |team|
			        @team_testlines.each do |team_testline|
			        	if team_testline.testline_id == testline.id && team.id == team_testline.team_id
			            	tag += content_tag :li, "" do
			                	tag1 = button_to team_testline, method: :delete, :class => "release show-delete-modal", :type => "button", form: {:onsubmit => "return ask_modal(-#{team_testline.id});"}, :id => -team_testline.id do
			                		content_tag :i, "", :class => "fa fa-times"
			                	end
			                	tag2 = content_tag(:span, "", :class => balls[team.id % 20]) + team.name
			                	(tag1 + tag2)
			                end
			           	end
			        end
			    end
			    tag.html_safe
			end
		end

		return tag.blank? ? content_tag(:p, "No team can currently use this testline", :style => "text-align: center;") : tag1.html_safe
	end

	def option_testline(testline)
		content_tag(:div, "", :class => "card-footer") do
	       content_tag(:a, 'Edit Testline', :href => "/testlines/#{testline.id}/edit", :class => "card-link" )+
        	link_to('Delete', testline, method: :delete, :class => "card-link text-red show-delete-modal" , :type => "button", :onclick => "if (ask_modal(-#{testline.id})) return; else {event.stopPropagation(); event.preventDefault();};", :id => "-#{testline.id}")
	    end
    end

    def admin_notice(arr, cont, notice)
    	tag2 = ""
    	tag1 = content_tag :div, '', :class => "notice-wrapper" do
	    	if arr.empty? && !notice.blank?
	    		#tag2 = content_tag :h4, "All #{cont} have been removed."
	    		tag2 = content_tag :h4, notice;
	    	elsif !notice.blank?
	    		tag2 = content_tag :h4, notice
	    	elsif arr.empty?
	    		tag2 = content_tag :h4, "There are no #{cont} yet."
	    	end
	    end
	    
	    tag2.empty? ? "" : tag1.html_safe
	end

	def teams_without_access(testline)
		balls = pokelist
		tag = ""
		@teams.each do |team|
			if not TeamTestline.exists?(team_id: team.id, testline_id: testline.id)
				tag += content_tag(:li, "") do
					form_for(@team_testline) do |f|
						f.hidden_field(:team_id, :value => team.id) +
						f.hidden_field(:testline_id, :value => testline.id) +
						content_tag(:button, "", :type => "submit", :class => "pokeballs-item") do
							content_tag(:span, "", :class => balls[team.id % 20]) + team.name
						end
					end
				end
			end
		end
		tag.html_safe
	end
end