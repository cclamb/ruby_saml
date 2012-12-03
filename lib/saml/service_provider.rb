require 'sinatra/base'
require 'net/http'

class ServiceProvider < Sinatra::Base

	get '/service' do
    headers \
      'Location' => 'location info',
      'Pragma' => 'no-cache', 
      'Cache-Control' => 'no-cache, no-store'
    redirect 'http://localhost:5679/identify', 303
  end

end