require_relative '../../../lib/saml/identity_provider'
require_relative '../../../lib/saml/service_provider'

SP_PORT = 5678
IDP_PORT = 5679

def spawn_servers

  test_state = {:sp_pid => 0, :idp_pid => 0}

  test_state[:sp_pid] = fork do
    $stdout = StringIO.new
    $stderr = StringIO.new
    ServiceProvider::set :port => SP_PORT
    ServiceProvider::run!
  end

  test_state[:idp_pid] = fork do
    $stdout = StringIO.new
    $stderr = StringIO.new
    IdentityProvider::set :port => IDP_PORT
    IdentityProvider::run!
  end

  test_state.each_value { |pid| puts pid }
  return test_state
end

def stop_servers test_state
  test_state.each_value do |pid|
    Process::kill :INT, pid
  end
end

test_state = nil

Given /^Running SPs and IdPs$/ do
  test_state = spawn_servers
  #stop_servers test_state
end

Then /^the SPs and IdPs will shut down$/ do
  stop_servers test_state
end

When /^a user attempts to access a resource$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the user does not have an authentication context$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the SP will HTTP redirect the user agent to the IdP$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the identification provider will query for some kind of credentials$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the IdP will verify the credentials$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the IdP will HTTP redirect the user agent back to the SP$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the SP will grant access to the resource$/ do
  pending
end