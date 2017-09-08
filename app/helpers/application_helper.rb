module ApplicationHelper

	def letterPicker(team_name, size)
		first_letter = team_name[0,1].downcase
		return "team-brand-" + size + " letter-" + first_letter
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

	def cardProps(testline)
		if testline.reservations.length == 0 && !testline.isMaintenance?
			return {testline: testline, color: "bg-green", icon: "fa-check"}
		elsif testline.reservations.length != 0 && !testline.isMaintenance?
			return {testline: testline, color: "bg-red", icon: "fa-times"}
		elsif testline.isMaintenance?
			return {testline: testline, color: "bg-yellow", icon: "fa-exclamation-triangle"}
		end
	end
	
	def reservationOrder(index)
		props = {}
		if index == 0
			props = {
				"class" => "primary",
				"text" => "Current",
				"icon" => "fa-star"
			}
		elsif index == 1
			props = {
				"class" => "next",
				"text" => "Next in Line",
				"icon" => "fa-arrow-circle-o-right"
			}
		else
			props = {
				"class" => "pending",
				"text" => "Pending",
				"icon" => "fa-spinner fa-pulse fa-fw"
			}
		end
		return props
	end
	
	def reserveText(testline)
		if testline.reservations.empty?
			return "Use Now!"
		else
			return "Reserve Now!"
		end
	end
	
	def didReserveTestline(testline)
		userReservation = nil
		testline.reservations.each do |r|
			if r.user.email == current_user.email
				userReservation = r
				break
			end
		end
		return userReservation
	end
end