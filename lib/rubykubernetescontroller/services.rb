require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require 'rubykubernetescontroller/generic'

module Services
  include Generic

  # Create new Service
  def create_new_service(namespace, config)
    extension = "/api/v1/namespaces/#{namespace}/services"

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

  # Get all Services
  def get_all_services
    extension = "/api/v1/services"

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

  # Get all existing Services in Namespace
  def get_all_namespaced_services(namespace)
    extension = "/api/v1/namespaces/#{namespace}/services"

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

  # Get single Service in Namespace
  def get_single_namespaced_service(namespace, service_name)
    extension = "/api/v1/namespaces/#{namespace}/services/#{service_name}"

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

  # Update existing Service in Namespace
  def update_namespaced_service(namespace, service_name, update)
    extension = "/api/v1/namespaces/#{namespace}/services/#{service_name}"

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

  # Patch existing Service
  def patch_service(namespace, service_name, patch)
    extension = "/api/v1/namespaces/#{namespace}/services/#{service_name}"

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

  # Delete existing Service
  def delete_service(namespace, service_name)
    extension = "/api/v1/namespaces/#{namespace}/services/#{service_name}"

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token, "DELETE")

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



