module TestlinesHelper
	def testline_sidenav
		isActive = {@testlines[0] => "active"}
		tag = ""
		content_tag(:aside, "", :class => "sidenav") do
			content_tag(:div, "", :class => "wrapper") do
				content_tag(:ul, "") do
					@testlines.each do |testline|
						tag += content_tag(:li, "") do
							content_tag(:a, "", :href => "javascript:void(0)", :class => "sidenav-links #{isActive[testline]}", :onclick => "openReservation(event, \'tl-#{testline.id}\')") do
								content_tag(:i, "", :class => "fa fa-server") + " " + testline.name
							end
						end
					end
					tag.html_safe
				end
			end
		end
	end

	def reserve_active(id)
		id == @testlines[0].id ? "block" : "none"
	end

	def reserve_header(reserve)
		content_tag(:div, "", :class => "list-item-header") do
			content_tag(:h3, reserve.name, :class => "title") +
			content_tag(:small, reserve.created_at.localtime.to_s(:db), :class => "timestamp") +
			content_tag(:p, reserve.team_name, :class => "subtitle")
		end
	end

	def reserve_init
		[["primary", "next", "pending", "pending"],
		["star", "fast-forward", "hourglass-1", "hourglass-1"],
		[" Current", " Next in Line", " Pending", " Pending"], 0]
	end

    def reserve_notice
    	content_tag :div, '', :class => "notice-wrapper" do
    		content_tag :h4, "This testline is currently not in use."
	    end
	end
end
