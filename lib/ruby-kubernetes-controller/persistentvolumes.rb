require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require_relative 'generic'

module PersistentVolumes
  include Generic

  # Create new PersistentVolume
  def create_new_persistentvolume(config)
    extension = "/api/v1/persistentvolumes"

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

  # Get all PersistentVolumes
  def get_all_persistentvolumes
    extension = "/apis/v1/persistentvolumes"

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

  # Get single PersistentVolume
  def get_single_persistentvolume(persistentvolume_name)
    extension = "/api/v1/persistentvolumes/#{persistentvolume_name}"

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

  # Update existing PersistentVolume
  def update_namespaced_persistentvolume(persistentvolume_name, update)
    extension = "/api/v1/persistentvolumes/#{persistentvolume_name}"

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

  # Patch existing PersistentVolume
  def patch_persistentvolume(persistentvolume_name, patch)
    extension = "/api/v1/persistentvolumes/#{persistentvolume_name}"

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

  # Delete existing PersistentVolume
  def delete_persistentvolume(persistentvolume_name, options = '')
    extension = "/api/v1/persistentvolumes/#{persistentvolume_name}"

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
