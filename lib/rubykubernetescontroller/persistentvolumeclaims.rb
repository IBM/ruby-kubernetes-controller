require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require 'rubykubernetescontroller/generic'

module PersistentVolumeClaims
  include Generic

  # Create new PersistentVolumeClaim
  def create_new_persistentvolumeclaim(namespace, config)
    extension = "/apis/apps/v1/namespaces/#{namespace}/persistentvolumeclaims"

    uri = prepareURI(@endpoint, extension)

    request = prepareGenericRequest(uri, @bearer_token,  "POST")
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

  # Get all PersistentVolumeClaims
  def get_all_persistentvolumeclaims
    extension = "/apis/apps/v1/persistentvolumeclaims"

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

  # Get all existing PersistentVolumeClaims in Namespace
  def get_all_namespaced_persistentvolumeclaims(namespace)
    extension = "/apis/apps/v1/namespaces/#{namespace}/persistentvolumeclaims"

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

  # Get single PersistentVolumeClaim in Namespace
  def get_single_namespaced_persistentvolumeclaim(namespace, persistentvolumeclaim_name)
    extension = "/apis/apps/v1/namespaces/#{namespace}/persistentvolumeclaims/#{persistentvolumeclaim_name}"

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

  # Update existing PersistentVolumeClaim in Namespace
  def update_namespaced_persistentvolumeclaim(namespace, persistentvolumeclaim_name, update)
    extension = "/apis/apps/v1/namespaces/#{namespace}/persistentvolumeclaims/#{persistentvolumeclaim_name}"

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

  # Patch existing PersistentVolumeClaim in Namespace
  def patch_persistentvolumeclaim(namespace, persistentvolumeclaim_name, patch)
    extension = "/apis/apps/v1/namespaces/#{namespace}/persistentvolumeclaims/#{persistentvolumeclaim_name}"

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

  # Delete existing PersistentVolumeClaim in Namespace
  def delete_persistentvolumeclaim(namespace, persistentvolumeclaim_name, options = '')
    extension = "/apis/apps/v1/namespaces/#{namespace}/persistentvolumeclaims/#{persistentvolumeclaim_name}"

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
