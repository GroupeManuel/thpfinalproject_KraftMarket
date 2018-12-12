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

  	def user_checked
  		requested_user = User.find(params[:id])
  
  		if user_signed_in? && requested_user == current_user
        true
  		else
        false
      end
  
  	end

end
