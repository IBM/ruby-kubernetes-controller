require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require 'rubykubernetescontroller/generic'

module Deployments
    include Generic
    
    # Create new Deployment
    def create_new_deployment(namespace, config)
        extension = "/apis/apps/v1beta1/namespaces/#{namespace}/deployments"
        
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
    
    # Get all Deployments
    def get_all_deployments
        extension = "/apis/apps/v1beta1/deployments"
        
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
    
    # Get all existing Deployments in Namespace
    def get_all_namespaced_deployments(namespace)
        extension = "/apis/apps/v1beta1/namespaces/#{namespace}/deployments"
        
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
    
    # Get single Deployment in Namespace
    def get_single_namespaced_deployment(namespace, deployment_name)
        extension = "/apis/apps/v1beta1/namespaces/#{namespace}/deployments/#{deployment_name}"
        
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
    
    # Update existing Deployment in Namespace
    def update_namespaced_deployment(namespace, deployment_name, update)
        extension = "/apis/apps/v1beta1/namespaces/#{namespace}/deployments/#{deployment_name}"
        
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
    
    # Patch existing Deployment in Namespace
    def patch_deployment(namespace, deployment_name, patch)
        extension = "/apis/apps/v1beta1/namespaces/#{namespace}/deployments/#{deployment_name}"
        
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
    
    # Delete existing Deployment in Namespace
    def delete_deployment(namespace, deployment_name, options = '')
        extension = "/apis/apps/v1beta1/namespaces/#{namespace}/deployments/#{deployment_name}"
        
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
