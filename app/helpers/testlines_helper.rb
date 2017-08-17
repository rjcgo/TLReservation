module TestlinesHelper
	def reserve_active(id)
		id == @testlines[0].id ? "display: block;" : "display: none;"
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
