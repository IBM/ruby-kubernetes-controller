require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require_relative 'generic'

module Namespaces
  include Generic

  # Create new Namespace
  def create_new_namespace(config)
    extension = "/api/v1/namespaces"

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token, "POST")
    request.content_type = "application/json"

    if @yaml
      request.body = yaml_file_to_json(config)
    else
      request.body = config
    end

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

  # Get Namespaces
  def get_all_namespaces
    extension = '/api/v1/namespaces'

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

  # Update existing Namespace
  def update_namespace(namespace, update)
    extension = "/api/v1/namespaces/#{namespace}"

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token, "PUT")
    request.content_type = "application/json"

    if @yaml
      request.body = yaml_file_to_json(update)
    else
      request.body = update
    end

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

  # Patch existing Namespace
  def patch_namespace(namespace, patch)
    extension = "/api/v1/namespaces/#{namespace}"

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token, "PATCH")
    request.content_type = "application/json-patch+json"

    request.body = patch

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

  # Delete existing Namespace
  def delete_namespace(namespace, options = '')
    extension = "/api/v1/namespaces/#{namespace}"

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token, "DELETE")
    request.content_type = "application/json"

    if @yaml
      request.body = yaml_file_to_json(options)
    else
      request.body = options
    end

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