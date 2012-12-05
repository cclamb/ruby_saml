require 'sinatra/base'
require 'net/http'

class IdentityProvider < Sinatra::Base

	get '/identify' do
		request.env.map { |e| puts "#{e.to_s}\n"}
		"identity\n"		
	end

end