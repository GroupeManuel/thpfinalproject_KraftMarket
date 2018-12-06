module UsersHelper

	#Helpers to externalize devise form from devise views
 	def resource_name
    	:user
 	end

  	def resource
    	@resource ||= User.new
  	end

  	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
  	end

end
