require 'net/http'
require 'uri'
require 'openssl'
require 'json'
require 'yaml'
require 'open-uri'

module Generic
  # Create a URI Object
  def prepareURI(endpoint, extension)
    URI.parse("https://#{endpoint}#{extension}")
  end

  # Create a URI Object with params
  def prepareURIWithParams(endpoint, extension, params)
    uri = URI.parse("https://#{endpoint}#{extension}")
    uri.query = URI.encode_www_form(params)
    
    uri
  end

  # Prepare a Generic Request Object
  def prepareGenericRequest(uri, bearer_token, type)
    if type == "GET"
      request = Net::HTTP::Get.new(uri)
    elsif type == "PATCH"
      request = Net::HTTP::Patch.new(uri)
    elsif type == "PUT"
      request = Net::HTTP::Put.new(uri)
    elsif type == "POST"
      request = Net::HTTP::Post.new(uri)
    elsif type == "DELETE"
      request = Net::HTTP::Delete.new(uri)
    else
      request = Net::HTTP::Get.new(uri)
    end
    request["Authorization"] = "Bearer #{bearer_token}"
    request["Accept"] = "application/json"

    request
  end

  # Prepare a Generic Request Options Object
  def prepareGenericRequestOptions(ssl, uri)
    if !ssl
      req_options = {
          use_ssl: uri.scheme == "https",
          verify_mode: OpenSSL::SSL::VERIFY_NONE,
      }
    else
      req_options = {
          use_ssl: uri.scheme == "https",
      }
    end

    req_options
  end

  # Check if entry is a valid JSON string
  def check_valid_json(json)
    !!JSON.parse(json)
  rescue JSON::ParserError => _e
    false
  end

  # Convert Yaml File to JSON
  def yaml_file_to_json(yaml_file)
    if !check_valid_json(yaml_file)
      if yaml_file != ''
        JSON.pretty_generate(YAML.load(open(yaml_file).read))
      else
        ''
      end
    else
      raise 'JSON entered instead of yaml file for a yaml client'
    end
  end
end