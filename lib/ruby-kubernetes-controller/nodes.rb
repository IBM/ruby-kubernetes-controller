require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require_relative 'generic'

module Nodes
  include Generic

  # Get Nodes
  def get_nodes
    extension = '/api/v1/nodes'

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token, "GET")

    req_options = prepareGenericRequestOptions(@ssl, uri)

    begin
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      return response.body

    rescue Errno::ECONNREFUSED
      raise "Connection for host #{uri.hostname} refused"
    end

  end

end