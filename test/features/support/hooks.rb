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

state = nil

Before do |scenario|
  state = spawn_servers
  sleep 1
end

After do |scenario|
  stop_servers state
end