class ApplicationController < ActionController::Base


	before_action :configure_permitted_params, if: :devise_controller?

	def configure_permitted_params

		devise_parameter_sanitizer.permit(:account_update, keys: [
		   	:first_name,
		    :last_name,
		    :phone_number,

		    :activity,
		    :company_name,
		    :company_ID_number,
		    :company_description,

		    :delivery_entity,
		    :delivery_street,
		    :delivery_street2,
		    :delivery_postcode,
		    :delivery_city,
		    :delivery_country,
		    :delivery_instructions,

		    :invoice_entity,
		    :invoice_street,
		    :invoice_street2,
		    :invoice_postcode,
		    :invoice_city,
		    :invoice_country  
			]
		)
	end


end
