require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require_relative 'generic'

module Jobs
    include Generic
    
    # Create new Job
    def create_new_job(namespace, config)
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs"
        
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
    
    # Get all Jobs
    def get_all_jobs
        extension = "/apis/batch/v1/jobs"
        
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
    
    # Get all existing Jobs in Namespace
    def get_all_namespaced_jobs(namespace)
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs"
        
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
    
    # Get single Job in Namespace
    def get_single_namespaced_job(namespace, job_name)
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs/#{job_name}"
        
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
    
    # Update existing Job in Namespace
    def update_namespaced_job(namespace, job_name, update)
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs/#{job_name}"
        
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
    
    # Patch existing Job in Namespace
    def patch_job(namespace, job_name, patch)
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs/#{job_name}"
        
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
    def delete_job(namespace, job_name, options = '')
        extension = "/apis/batch/v1/namespaces/#{namespace}/jobs/#{job_name}"
        
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
