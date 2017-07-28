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
		@teams.each do |team|
	        @team_testlines.each do |team_testline|
	        	if team_testline.testline_id == testline.id && team.id == team_testline.team_id
	            	tag += content_tag :li, "" do
	                	tag1 = button_to team_testline, method: :delete, :class => "release show-delete-modal", :type => "button", form: {:onsubmit => "return ask_modal(-#{team_testline.id});", :id => team_testline.id} do
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
