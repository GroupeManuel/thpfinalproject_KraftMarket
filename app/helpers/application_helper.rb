module ApplicationHelper
	include ItemsHelper
	include UsersHelper

	#Detect if the view include a page title
	def title(page_title)
    	content_for(:title) { page_title }
  	end

	def flash_class(level)
		case level
			when 'notice' then "notification notice closeable"
			when 'success' then "notification success closeable"
			when 'error' then "notification error closeable"
			when 'alert' then "notification warning closeable"
		end
	end
end




