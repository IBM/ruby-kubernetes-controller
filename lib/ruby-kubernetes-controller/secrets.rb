require 'net/http'
require 'uri'
require 'openssl'
require 'json'
require_relative 'generic'
module Secrets
  include Generic
  # Create new Secret
  def create_new_secret(namespace, secret)
    extension = "/api/v1/namespaces/#{namespace}/secrets"
    uri = prepareURI(@endpoint, extension)
    request = prepareGenericRequest(uri, @bearer_token,  "POST")
    request.content_type = "application/json"
    if @yaml
      request.body = yaml_file_to_json(secret)
    else
      request.body = secret
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
  # Get all Secrets
  def get_all_secrets
    extension = "/api/v1/secrets"
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
  # Get all Secrets in a Namespace
  def get_all_namespaced_secrets(namespace)
    extension = "/api/v1/namespaces/#{namespace}/secrets"
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
  # Get a single Secret from a Namespace
  def get_single_namespaced_secret(namespace, secret_name)
    extension = "/api/v1/namespaces/#{namespace}/secrets/#{secret_name}"
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
  # Update existing Secret in Namespace
  def update_secret(namespace, secret_name, update)
    extension = "/api/v1/namespaces/#{namespace}/secrets/#{secret_name}"
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
  # Patch existing Secret in Namespace
  def patch_secret(namespace, secret_name, patch)
    extension = "/api/v1/namespaces/#{namespace}/secrets/#{secret_name}"
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
  # Delete existing Secret in Namespace
  def delete_secret(namespace, secret_name, options = '')
    extension = "/api/v1/namespaces/#{namespace}/secrets/#{secret_name}"
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