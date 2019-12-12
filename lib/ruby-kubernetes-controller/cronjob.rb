require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require_relative 'generic'

module Jobs
    include Generic
    
    # Create new CronJob
    def create_new_cronjob(namespace, config)
        extension = "/apis/batch/v2alpha1/namespaces/#{namespace}/cronjobs"
        
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
    
    # Get all CronJobs
    def get_all_cronjobs
        extension = "/apis/batch/v2alpha1/cronjobs"
        
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
    
    # Get all existing CronJobs in Namespace
    def get_all_namespaced_cronjobs(namespace)
        extension = "/apis/batch/v2alpha1/namespaces/#{namespace}/cronjobs"
        
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
    
    # Get single CronJob in Namespace
    def get_single_namespaced_cronjob(namespace, cronjob_name)
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs/#{cronjob_name}"
        
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
    
    # Update existing CronJob in Namespace
    def update_namespaced_cronjob(namespace, cronjob_name, update)
        extension = "/apis/batch/v2alpha1/namespaces/#{namespace}/cronjobs/#{cronjob_name}"
        
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
    
    # Patch existing CronJob in Namespace
    def patch_cronjob(namespace, cronjob_name, patch)
        extension = "/apis/batch/v2alpha1/namespaces/#{namespace}/cronjobs/#{cronjob_name}"
        
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
    
    # Delete existing Job in Namespace
    def delete_cronjob(namespace, cronjob_name, options = '')
        extension = "apis/batch/v2alpha1/namespaces/#{namespace}/cronjobs/#{cronjob_name}"
        
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
