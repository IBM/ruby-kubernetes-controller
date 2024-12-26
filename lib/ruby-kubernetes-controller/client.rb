require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require_relative 'generic'
require_relative 'namespaces'
require_relative 'ingresses'
require_relative 'nodes'
require_relative 'endpoints'
require_relative 'pods'
require_relative 'services'
require_relative 'deployments'
require_relative 'replicasets'
require_relative 'configmaps'
require_relative 'persistentvolumes'
require_relative 'persistentvolumeclaims'
require_relative 'jobs'
require_relative 'cronjob'
require_relative 'utilities'
require_relative 'secrets'

# Part of the RubyKubernetesController module
module RubyKubernetesController

  # Client Class
  class Client

    include Generic
    include Namespaces
    include Ingresses
    include Nodes
    include Endpoints
    include Pods
    include Services
    include Deployments
    include ReplicaSets
    include ConfigMaps
    include PersistentVolumes
    include PersistentVolumeClaims
    include Jobs
    include CronJobs
    include Utilities
    include Secrets

    # Constructor
    def initialize(endpoint, bearer_token, ssl = true, yaml = false)
      # Instantiating client variables
      @endpoint = endpoint
      @bearer_token = bearer_token
      @bearer_token = default_serviceaccount_token if bearer_token.empty?
      @ssl = ssl
      @yaml = yaml
    end

    # Return endpoint
    def getEndpoint
      @endpoint
    end

    # Return Bearer Token
    def getBearer
      @bearer_token
    end

    # Return SSL choice
    def getSSL
      @ssl
    end

    # Reads the Bearer Token from the pod
    private

    def default_serviceaccount_token
      return "" unless File.exist?("/var/run/secrets/kubernetes.io/serviceaccount/token")

      File.read("/var/run/secrets/kubernetes.io/serviceaccount/token")
   end
  end
end
