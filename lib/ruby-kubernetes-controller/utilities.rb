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

module Utilities
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

  # Trigger a cronjob
  def trigger_cronjob(namespace, cronjob_name)
    cronjob_reponse = get_single_namespaced_cronjob(namespace, cronjob_name)
    cronjob_json = JSON.parse(cronjob_reponse)
    json_config =
        "{
          'kind': 'Job',
          'apiVersion': 'extensions/v1beta1',
          'metadata': {
            'name': #{cronjob_json['metadata']['name']}
          },
          'spec': {
            'template': {
              'spec': #{cronjob_json['spec']['jobTemplate']['spec']}
            }
          }
        }"
    puts(json_config)
  end

end
