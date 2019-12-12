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

    # Constructor
    def initialize(endpoint, bearer_token, ssl = true, yaml = false)
      # Instantiating client variables
      @endpoint = endpoint
      @bearer_token = bearer_token
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
  end
end