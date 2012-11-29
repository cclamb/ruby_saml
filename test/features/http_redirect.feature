Feature: HTTP Redirect Binding

  HTTP redirect SAML bindings use standard HTTP redirect semantics combined with encoded XML documents on the command line.

  Scenario: Authentication
    Given Running SPs and IdPs
    When a user attempts to access a resource
    And the user does not have an authentication context
    Then the SP will HTTP redirect the user agent to the IdP
    And the identification provider will query for some kind of credentials
    And the IdP will verify the credentials
    And the IdP will HTTP redirect the user agent back to the SP
    And the SP will grant access to the resource
    And the SPs and IdPs will shut down
