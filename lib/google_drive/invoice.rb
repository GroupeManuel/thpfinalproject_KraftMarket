require 'google/api_client/client_secrets'

require 'googleauth'
require 'googleauth/stores/redis_token_store'

class Invoice


	def copy_template(order_id)

	end

	def modify_gsheet(order_id)
		session = GoogleDrive::Session.from_config("config.json")
		ws = session.spreadsheet_by_key("1Pk3m22jPOnedKUIaYWUzM5dBLQ4T7sEKoUHngc0Ircg").worksheets[0]
		
	#		@emails[1].keys.each_with_index {|value, i|
	#			ws[1,i+1] = value
	#		}

		@emails.each_with_index { |hash, line|
			ws[line+2,1] = hash[:city]
			ws[line+2,2] = hash[:email]
		}
		ws.save
	end

end

=begin
require 'google_drive'
require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

	#open invoice template in GoogleSheet


OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Google Sheets API Ruby Quickstart'.freeze
CREDENTIALS_PATH = 'config_gdrive.json'.freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = 'token.yaml'.freeze
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: OOB_URI)
    puts 'Open the following URL in the browser and enter the ' \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end

# Initialize the API
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Prints the names and majors of students in a sample spreadsheet:
# https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
spreadsheet_id = '1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms'
range = 'Class Data!A2:E'
response = service.get_spreadsheet_values(spreadsheet_id, range)
puts 'Name, Major:'
puts 'No data found.' if response.values.empty?
response.values.each do |row|
  # Print columns A and E, which correspond to indices 0 and 4.
  puts "#{row[0]}, #{row[4]}"
end


=end
