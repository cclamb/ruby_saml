require 'nokogiri'

class Saml

	def initialize &b
    instance_exec &b
  end

  def issuer issuer, attribs = {}
    @issuer = issuer
    @issuer_attribs = attribs
  end

  def name_id name_id, attribs = {}
    @name_id = name_id
    @name_id_attribs = attribs
  end

  def session_index idx, attribs = {}
    @session_idx = idx
    @session_idx_attribs = attribs
  end

  def xml
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      #xml.doc.add_namespace 'xmlns:samlp', 'urn:oasis:names:tc:SAML:2.0:protocol'
      xml.LogoutRequest('xmlns' => 'urn:oasis:names:tc:SAML:2.0:assertion',
        'xmlns:samlp' => 'urn:oasis:names:tc:SAML:2.0:protocol',
        'ID' => '1',
        'IssueInstant' => Time.now.to_s,
        'Version' => '2.0') do
        xml.Issuer @issuer , @issuer_attribs
        xml.NameID @name_id, @name_id_attribs
        xml['samlp'].SessionIndex @session_idx, @session_idx_attribs
        xml.parent.namespace = xml.parent.namespace_definitions.find{ |ns| ns.prefix == 'samlp'}
      end
    end
    builder.to_xml
  end

end