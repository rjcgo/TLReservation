module TestlinesHelper
	def testline_sidenav
		isActive = {@testlines[0] => "active"}
		tag = ""
		empty = ""
		aside_class = "sidenav"
		div_class = "wrapper"
		span_class = "badge badge-pill bg-yellow"
		style = "float: right;"
		i_class = "fa fa-server"
		href = "javascript:void(0)"

		content_tag(:aside, :class => aside_class) do
			content_tag(:div, :class => div_class) do
				content_tag(:ul) do
					@testlines.each do |testline|
						tag += content_tag(:li) do
							content_tag(:a, :href => href, :class => "sidenav-links #{isActive[testline]}", :onclick => "openReservation(event, \'tl-#{testline.id}\')") do
								content_tag(:i, empty, :class => i_class) +
								" #{testline.name} " + 
								content_tag(:span, testline.reservations.count, :class => span_class, :style => span_class)
							end
						end
					end
					tag.html_safe
				end
			end
		end
	end

	def reserve_active(id)
		id == @testlines[0].id ? "display: block;" : "display: none;"
	end

	def reserve_header(reserve)
		content_tag(:div, :class => "list-item-header") do
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
    	content_tag(:div, :class => "notice-wrapper") do
			content_tag(:h4, "This test line is currently not in use.")
	    end
	end

	def no_testline_notice
		content_tag(:div, :class => "notice-wrapper") do
    		content_tag(:h4, "There are no test lines yet.")
	    end
	end

	def new_testline_link
		link_class = "add-btn"
		i_class = "fa fa-plus"
		empty = ""

		link_to(new_testline_path, :class => link_class) do
			content_tag(:i, empty, :class => i_class) +
			" New Testline"
		end
	end

end
