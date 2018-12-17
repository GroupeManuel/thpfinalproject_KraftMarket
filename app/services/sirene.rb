require "httparty"
require "base64"


class Sirene

	attr_accessor :error 

	def initialize(request)
#		@client_id = ENV['insee_client_id']
#		@client_secret = ENV['insee_client_secret']
		@client_id = 'Qn3s1XfykocAzkbWROoHMiTxf48a'
		@client_secret = 'uQYWbA32UkZAH5j0nnA0QncaduAa'
		@request = request
        @error = nil
	end

	def token_request
		encoding = "Basic " + Base64.strict_encode64("#{@client_id}:#{@client_secret}")
		HTTParty.post(
			"https://api.insee.fr/token",
		  	body: {'grant_type' => 'client_credentials'},
			headers: {'Authorization': encoding }
		)
	end

	#Error definition in case request format is not correct
	def format_error
		if @request.slice(/\d*/).size == 9 #Siren id detected
        	@siret = get_siret_from_siren(@request.slice(/\d*/))
        	return false
     	elsif @request.slice(/\d*/).size == 14 #Siret id detected
        	@siret= @request.slice(/\d*/)
        	return false
      	else #Format error
        	@error = 'Le nombre saisi doit contenir 9 (SIREN) ou 14 (SIRET) chiffres.'
        	return true
      	end
	end

	#Error definition in case no result is found when calling Sirene API
	def no_result
		if @result['header']['statut'] == 200 #successful search
			return false
		elsif @result['header']['statut'] == 404
			@error = 'Aucune entreprise ne correspond à votre recherche ('+@request+').'
			return true
		else
			@error = result['header']['statut'] +' : '+result['header']['message']
			return true
		end
	end
	
	#API call to get SIRET in case SIREN is provided
	def get_siret_from_siren(siren)
		@result = HTTParty.get(
			"https://api.insee.fr/entreprises/sirene/V3/siren/#{siren}",
			headers: {
		      	"Content-Type": 'application/json',
		      	"Accept": 'application/json',
		      	"Authorization": "Bearer #{@token}"
    		})
		unless no_result
			siren+@result['uniteLegale']["periodesUniteLegale"][0]["nicSiegeUniteLegale"]
		end
	end

	#API call to get all company attributes
	def siret_search
		@result = HTTParty.get(
			"https://api.insee.fr/entreprises/sirene/V3/siret/#{@siret}",
			headers: {
		      	"Content-Type": 'application/json',
		      	"Accept": 'application/json',
		      	"Authorization": "Bearer #{@token}"
    		})
		unless no_result
			@entity = @result['etablissement']['uniteLegale']
			@address = @result['etablissement']['adresseEtablissement']
		end
	end


	def activity

		#extract activity class corresponding to the company from the siret api search
		activity_class = @entity['activitePrincipaleUniteLegale']

		#save activity type linked to the class in a hash by calling API 'Nomenclatures'
		class_search = HTTParty.get(
				"https://api.insee.fr/metadonnees/nomenclatures/v1/codes/nafr2/sousClasse/#{activity_class}",
				headers: {
			      	"Content-Type": 'application/json',
			      	"Accept": 'application/json',
			      	"Authorization": "Bearer #{@token}"
	    		})

	    return { activity_id: activity_class, activity: class_search['intitule'] }

	end

	#extract city official name from siret search result by calling API 'Nomenclatures'
	def city_name
        codeCommune = @address['codeCommuneEtablissement']
        search = HTTParty.get(
			"https://api.insee.fr/metadonnees/nomenclatures/v1/geo/commune/#{codeCommune}",
			headers: {
		      	"Content-Type": 'application/json',
		      	"Accept": 'application/json',
		      	"Authorization": "Bearer #{@token}"
    		})
        return search['intitule']
	end

	#Concatenate street name from
	def street_formatted
		number = @address['numeroVoieEtablissement']
		street_type = @address['typeVoieEtablissement']
        street_name = @address['libelleVoieEtablissement']

        street =''
      	if number
      		street = number + ' '
      	end

      	if street_type #add street type capitalized
      		street += street_type.capitalize! + ' '
      	end

        #Capitalize words in street_name
        street += street_name.split(' ').map{|w| w.capitalize }.join(' ')
  		
  		street_lines = {invoice_street: street}

  		if @address['complementAdresseEtablissement']
  			street_lines[:invoice_street2] = @address['complementAdresseEtablissement'].capitalize
  		end

  		return street_lines
  	end

  	def date_formatted
  		date_splitted = @entity['dateCreationUniteLegale'].split('-')
		Date.new(date_splitted[0].to_i,date_splitted[1].to_i,date_splitted[2].to_i)
  	end

	def company_attributes
        {
          	company_ID_number: @siret,
          	invoice_entity: @entity['denominationUniteLegale'],
          	company_name: @entity['denominationUniteLegale'],
          	company_foundation: date_formatted,
          	invoice_postcode: @address['codePostalEtablissement'],
          	invoice_city: city_name,
          	invoice_country:'FR'
        }.merge(street_formatted).merge(activity)
    end

    def perform
    	@token = token_request['access_token']
    	format_error
    	unless @error
    		siret_search
	    	unless no_result
    			company_attributes
    		end
    	end
    end
end

puts Sirene.new('sdfs').perform
puts @error
puts Sirene.new('610662213').perform
puts @error
puts Sirene.new('810662213').perform
puts @error


