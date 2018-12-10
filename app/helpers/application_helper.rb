module ApplicationHelper
	include ItemsHelper
	include UsersHelper

	#Detect if the view include a page title
	def title(page_title)
    	content_for(:title) { page_title }
  	end

end
