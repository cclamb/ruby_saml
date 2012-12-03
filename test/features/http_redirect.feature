Feature: HTTP Redirect Binding

  HTTP redirect SAML bindings use standard HTTP redirect semantics combined with encoded XML documents on the command line.

  Scenario: Authentication
    Given a running SP and IdP
    When a user attempts to access a resource
    And the user does not have an authentication context
    Then the SP will HTTP redirect the user agent to the IdP with a SAML request
    And the request will have a SAMLRequest, SigAlg, and Signature section in query parameters
    And the identification provider will query for some kind of credentials
    And the IdP will verify the credentials
    And the IdP will HTTP redirect the user agent back to the SP
    And the SP will grant access to the resource
