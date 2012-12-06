require 'rspec'

require_relative '../../lib/saml'

describe Saml do
	it 'should be configurable via a block submitted to the constructor' do
    saml = Saml.new do
      issuer        'some URL string'
      name_id       'some value', :format => :foo
      session_index 1
    end
  end
end