class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
	end
	
	# Coordonné avec le model Artisan, une fois qu'un artisan est créé
	def new_subscriber(email)
		@gibbon.lists("c3c516a4aa").members.create(
			body: {email_address: email, status: "subscribed"}
			)
	end

	# Coordonné par le controller order, une fois qu'un order est créé
	def new_buyer(email)
		@gibbon.lists("c3c516a4aa").segments("11385").members.create(body: {email_address: email})
		puts "fuck gibbon"
	end


######### NOT USEFUL FOR APP - USE ONLY to know your list_id or automation_id or any id
	def retrieve
		@gibbon.lists("c3c516a4aa").members.retrieve
	end
	def retrieve2
		@gibbon.automations.retrieve
	end
	def retrieve3
		@gibbon.lists("c3c516a4aa")
	end
######### NOT USEFUL FOR APP

end

#useful info 
# https://github.com/amro/gibbon
# https://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/
# https://developer.mailchimp.com/documentation/mailchimp/guides/how-to-use-tags/