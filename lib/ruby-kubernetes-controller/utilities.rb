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
  def trigger_cronjob(namespace, cronjob_name, restart_policy = 'Never')
    cronjob_json = JSON.parse(get_single_namespaced_cronjob(namespace, cronjob_name))
    cronjob_json['spec']['jobTemplate']['spec']['template']['spec']['restartPolicy'] = restart_policy
    cronjob_json['metadata']['name'] += '-' + ('a'..'z').to_a.shuffle[0,8].join
    json_config =
        '{
          "kind": "Job",
          "apiVersion": "batch/v1",
          "metadata": {
            "name": ' + cronjob_json['metadata']['name'].to_json + '
          },
          "spec": {
            "template": ' + cronjob_json['spec']['jobTemplate']['spec']['template'].to_json + '
          }
        }'
    create_new_job(namespace, json_config)
  end

end
