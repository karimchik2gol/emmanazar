module MenuHelper
	def menu_link_to(path, name, label = nil)
		@path = path
		@name = label || name.pluralize
		render "partials/menu_link"
	end
end