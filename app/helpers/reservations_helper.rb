module ReservationsHelper
	def reservations_notice(arr, cont, notice)
    	tag2 = ""
    	tag1 = content_tag :div, '', :class => "notice-wrapper" do
	    	if cont.empty? && !notice.blank?
	    		tag2 = content_tag :h4, "All #{cont} have been removed."
	    	elsif !notice.blank?
	    		tag2 = content_tag :h4, notice
	    	elsif cont.empty? || arr.empty?
	    		tag2 = content_tag :h4, "There are no #{cont} yet."
	    	end
	    end
	    tag2.empty? ? "" : tag1.html_safe
	end

end
