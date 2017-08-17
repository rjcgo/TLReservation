module ApplicationHelper

    def modal_content(page)
    	modal_text = {
    		"associations" => "Are you sure you want to remove this team's access from this testline?",
    		"teams" => "Are you sure you want to delete this team?",
    		"testlines" => "Are you sure you want to delete this testline?",
    		"users" => "Are you sure you want to make this user an admin?",
    		"reservations" => "Are you sure you want to release your reservation? This may take a few seconds."
    	}

    	modal_title = {
    		"associations" => "Remove access",
    		"teams" => "Delete",
    		"testlines" => "Delete",
    		"users" => "Make Admin",
    		"reservations" => "Release"
    	}


    	btn_text = page == "reservations" ? "Confirm" : modal_title[page]
    	bg_color = page == "users" ? "bg-blue" : "bg-red"
    	icon = page == "users" ? "fa fa-cogs" : "fa fa-trash"
    	return {
			:icon => icon, 
			:modal_text => modal_text[page], 
			:modal_title => modal_title[page], 
			:bg_color => bg_color, 
			:btn_text => btn_text
		}
    end

    def first_reserve(testline)
    	testline.reservations.each do |reserve|
    		if testline.id == reserve.testline_id
    			return reserve
    		end
    	end
    	return nil;
	end
	
    def timer_script(testlines)
    	t = ""
    	testlines.each do |testline|
    		reserve = first_reserve testline
    		if !reserve.nil?
    			cur_int = Time.now.minus_with_coercion(reserve.start_time).to_i
				t << "t[\"tm-#{testline.id}\"] = #{cur_int};"
			end
    	end
    	return t.html_safe;
	end
	
	def reserveOrder(index)
		props = {}
		if index == 0
			props = {
				"class" => "primary",
				"text" => "Current",
				"icon" => "star"
			}
		elsif index == 1
			props = {
				"class" => "next",
				"text" => "Next in Line",
				"icon" => "fast-forward"
			}
		else
			props = {
				"class" => "pending",
				"text" => "Pending",
				"icon" => "hourglass-1"
			}
		end
		return props
	end
end