require 'net/http'
require 'uri'

SP_URL = 'http://localhost:5678/service'
IDP_URL = 'http://localhost:5679/identify'

state = {
  :initial_sp_response => nil,
  :initial_idp_response => nil
}

Given /^a running SP and IdP$/ do
  sp_uri = URI::parse SP_URL
  idp_uri = URI::parse IDP_URL
  sp_response = Net::HTTP::get_response sp_uri
  idp_response = Net::HTTP::get_response idp_uri
  (sp_response.code == '302' || sp_response.code == '303').should eq true
  idp_response.code.should eq '200'
end

When /^a user attempts to access a resource$/ do
#  pending # express the regexp above with the code you wish you had
  uri = URI::parse SP_URL
  state[:initial_sp_response] = Net::HTTP::get_response uri
  (state[:initial_sp_response].code == '303' || state[:initial_sp_response].code == '302').should eq true
end

When /^the user does not have an authentication context$/ do
  # pending # express the regexp above with the code you wish you had
end

Then /^the SP will HTTP redirect the user agent to the IdP with a SAML request$/ do
  forward_uri = URI::parse state[:initial_sp_response]['location']
  state[:initial_idp_response] = Net::HTTP::get_response forward_uri
  (state[:initial_idp_response].code == '303' || state[:initial_idp_response].code == '302').should eq true
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