require 'net/http'
require 'uri'
require 'openssl'
require 'json'

require 'rubykubernetescontroller/generic'
require 'rubykubernetescontroller/namespaces'
require 'rubykubernetescontroller/ingresses'
require 'rubykubernetescontroller/nodes'
require 'rubykubernetescontroller/endpoints'
require 'rubykubernetescontroller/pods'
require 'rubykubernetescontroller/services'
require 'rubykubernetescontroller/deployments'
require 'rubykubernetescontroller/replicasets'
require 'rubykubernetescontroller/configmaps'
require 'rubykubernetescontroller/persistentvolumes'
require 'rubykubernetescontroller/persistentvolumeclaims'

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