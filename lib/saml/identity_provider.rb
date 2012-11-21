require 'sinatra/base'
require 'net/http'

class IdentityProvider < Sinatra::Base

	get '/identify' do
		"identity\n"		
	end

end