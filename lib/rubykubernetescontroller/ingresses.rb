require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require 'rubykubernetescontroller/generic'

module Ingresses
  include Generic

  # Create new Ingress
  def create_new_ingress(namespace, config)
    extension = "/apis/extensions/v1beta1/namespaces/#{namespace}/ingresses"

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

  # Get all Ingresses
  def get_all_ingresses
    extension = "/apis/extensions/v1beta1/ingresses"

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

  # Get all existing Ingresses in Namespace
  def get_all_namespaced_ingresses(namespace)
    extension = "/apis/extensions/v1beta1/namespaces/#{namespace}/ingresses"

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

  # Get single Ingress in Namespace
  def get_single_namespaced_ingress(namespace, ingress_name)
    extension = "/apis/extensions/v1beta1/namespaces/#{namespace}/ingresses/#{ingress_name}"

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

  # Update existing Ingress in Namespace
  def update_namespaced_ingress(namespace, ingress_name, update)
    extension = "/apis/extensions/v1beta1/namespaces/#{namespace}/ingresses/#{ingress_name}"

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

  # Patch existing Ingress
  def patch_ingress(namespace, ingress_name, patch)
    extension = "/apis/extensions/v1beta1/namespaces/#{namespace}/ingresses/#{ingress_name}"

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
  def delete_ingress(namespace, ingress_name, options = '')
    extension = "/apis/extensions/v1beta1/namespaces/#{namespace}/ingresses/#{ingress_name}"

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
