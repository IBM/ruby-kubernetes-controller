require_relative "test_helper"

class RubyKubernetesControllerTEST < Minitest::Test
  def test_version_number
    refute_nil ::RubyKubernetesController::VERSION
  end

  def test_client_creation
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_equal("localhost", client.getEndpoint)
    assert_equal(false, client.getSSL)
    assert_equal("TOKEN", client.getBearer)
  end

  def test_client_get_nodes
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_nodes
    end
  end

  def test_client_create_new_namespace

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_namespace('{"kind": "Namespace","apiVersion": "v1"}')
    end
  end

  def test_client_get_all_namespaces

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaces
    end
  end

  def test_client_update_namespace

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespace("default", '{"kind": "Namespace","apiVersion": "v1"}')
    end
  end

  def test_client_patch_namespace
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_namespace('default', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_namespace
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.delete_namespace('default', '{"kind": "Namespace","apiVersion": "v1"}')
    end
  end

  def test_client_create_new_ingress
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_ingress('default', '{"apiVersion":"networking.k8s.io/v1beta1","kind":"Ingress","metadata":{"name":"test-ingress"},"spec":{"backend":{"serviceName":"testsvc","servicePort":80}}}')
    end
  end

  def test_client_get_all_ingresses
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_ingresses
    end
  end

  def test_client_get_all_namespaced_ingresses
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_ingresses('default')
    end
  end

  def test_client_get_single_namespaced_ingress
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_ingress('default', 'ingress')
    end
  end

  def test_client_update_namespaced_ingress

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_ingress("default","ingress",'{"kind": "Ingress","apiVersion": "networking.k8s.io/v1beta1"}')
    end
  end

  def test_client_patch_ingress
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_ingress('default','ingress', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_ingress
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_ingress('default',"ingress", '{"kind": "Ingress","apiVersion": "networking.k8s.io/v1beta1"}')
    end
  end

  def test_client_create_new_replicaset
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_replicaset('default', '{"apiVersion":"apps/v1","kind":"ReplicaSet","metadata":{"name":"test-replicaset"},"spec":{"backend":{"serviceName":"testsvc","servicePort":80}}}')
    end
  end

  def test_client_get_all_replicasets
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_replicasets
    end
  end

  def test_client_get_all_namespaced_replicasets
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_replicasets('default')
    end
  end

  def test_client_get_single_namespaced_replicaset
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_replicaset('default', 'replicaset')
    end
  end

  def test_client_update_namespaced_replicaset

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_replicaset("default","replicaset",'{"kind": "ReplicaSet","apiVersion": "apps/v1"}')
    end
  end

  def test_client_patch_replicaset
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_replicaset('default','replicaset', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_replicaset
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_replicaset('default',"replicaset", '{"kind": "ReplicaSet","apiVersion": "apps/v1"}')
    end
  end

  def test_client_create_new_endpoint
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_endpoint('default', '{"kind":"Endpoints","apiVersion":"v1"}')
    end
  end

  def test_client_get_all_endpoints
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_endpoints
    end
  end

  def test_client_get_all_namespaced_endpoints
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_endpoints('default')
    end
  end

  def test_client_get_single_namespaced_endpoint
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_endpoint('default', 'endpoint')
    end
  end

  def test_client_update_namespaced_endpoint

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_endpoint("default","endpoint",'{"kind":"Endpoints","apiVersion":"v1"}')
    end
  end

  def test_client_patch_endpoint
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_endpoint('default','endpoint', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_endpoint
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_endpoint('default',"endpoint", '{"kind":"Endpoints","apiVersion":"v1"}')
    end
  end

  def test_client_create_new_pod
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_pod('default', '{"kind":"Pod","apiVersion":"v1"}')
    end
  end

  def test_client_get_all_pods
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_pods
    end
  end

  def test_client_get_all_namespaced_pods
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_pods('default')
    end
  end

  def test_client_get_all_namespaced_pods_with_field_selector
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_pods_with_field_selector('default', 'field_selector')
    end
  end

  def test_client_get_all_namespaced_pods_with_label_selector
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_pods_with_label_selector('default', 'label_selector')
    end
  end

  def test_client_get_single_namespaced_pod
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_pod('default', 'pod')
    end
  end

  def test_client_update_namespaced_pod

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_pod("default","pod",'{"kind":"Pod","apiVersion":"v1"}')
    end
  end

  def test_client_patch_pod
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_pod('default','pod', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_pod
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_pod('default',"pod", '{"kind":"Pod","apiVersion":"v1"}')
    end
  end

  def test_client_create_new_service
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_service('default', '{"kind":"Service","apiVersion":"v1"}')
    end
  end

  def test_client_get_all_services
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_services
    end
  end

  def test_client_get_all_namespaced_services
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_services('default')
    end
  end

  def test_client_get_single_namespaced_service
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_service('default', 'service')
    end
  end

  def test_client_update_namespaced_service

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_service("default","service",'{"kind":"Service","apiVersion":"v1"}')
    end
  end

  def test_client_patch_service
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_service('default','service', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_service
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_service('default',"service")
    end
  end

  def test_client_create_new_deployment
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_deployment('default', '{"kind":"Deployment","apiVersion":"apps/v1"}')
    end
  end

  def test_client_get_all_deployments
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_deployments
    end
  end

  def test_client_get_all_namespaced_deployments
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_deployments('default')
    end
  end

  def test_client_get_single_namespaced_deployment
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_deployment('default', 'deployment')
    end
  end

  def test_client_update_namespaced_deployment

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_deployment("default","deployment",'{"kind":"Deployment","apiVersion":"apps/v1"}')
    end
  end

  def test_client_patch_deployment
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_deployment('default','deployment', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_deployment
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_deployment('default',"deployment", '{"kind":"Deployment","apiVersion":"apps/v1"}')
    end
  end

  def test_client_create_new_configmap

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_configmap("default", '{"kind": "ConfigMap","apiVersion": "v1"}')
    end
  end

  def test_client_get_all_configmaps

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_configmaps
    end
  end

  def test_client_update_configmap

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_configmap("default", "ConfigMap", '{"kind": "ConfigMap","apiVersion": "v1"}')
    end
  end

  def test_client_patch_configmap
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_configmap('default', "ConfigMap", '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_configmap
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.delete_configmap('default', "ConfigMap", '{"kind": "ConfigMap","apiVersion": "v1"}')
    end
  end

  def test_client_create_new_secret
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.create_new_secret('default', '{"kind": "Secret","apiVersion": "v1"}')
    end
  end
  
  def test_client_get_all_secrets
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.get_all_secrets
    end
  end
  
  def test_client_get_all_namespaced_secrets
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.get_all_namespaced_secrets('default')
    end
  end
  
  def test_client_get_single_namespaced_secret
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.get_single_namespaced_secret('default', 'my-secret')
    end
  end
  
  def test_client_update_secret
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.update_secret('default', 'my-secret', '{"kind": "Secret","apiVersion": "v1"}')
    end
  end
  
  def test_client_patch_secret
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.patch_secret('default', 'my-secret', '{"op": "replace", "path": "/data", "value": "new-value"}')
    end
  end
  
  def test_client_delete_secret
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)
  
    assert_raises Exception do
      client.delete_secret('default', 'my-secret', '{"kind": "Secret","apiVersion": "v1"}')
    end
  end

  def test_client_create_new_job
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_job('default', '{"kind":"Job","apiVersion":"apis/batch/v1"}')
    end
  end

  def test_client_get_all_jobs
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_jobs
    end
  end

  def test_client_get_all_namespaced_jobs
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_jobs('default')
    end
  end

  def test_client_get_single_namespaced_job
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_job('default', 'job')
    end
  end

  def test_client_update_namespaced_job

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_job("default","job",'{"kind":"Job","apiVersion":"apis/batch/v1"}')
    end
  end

  def test_client_patch_job
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_job('default','job', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_job
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_job('default',"job", '{"kind":"Job","apiVersion":"apis/batch/v1"}')
    end
  end

  def test_client_create_new_cronjob
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.create_new_cronjob('default', '{"kind": "CronJob","apiVersion":"batch/v1beta1"}')
    end
  end

  def test_client_get_all_cronjobs
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_cronjobs
    end
  end

  def test_client_get_all_namespaced_cronjobs
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_all_namespaced_cronjobs('default')
    end
  end

  def test_client_get_single_namespaced_cronjob
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.get_single_namespaced_cronjob('default', 'cronjob')
    end
  end

  def test_client_update_namespaced_cronjob

    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.update_namespaced_cronjob("default","cronjob",'{"kind": "CronJob","apiVersion":"batch/v1beta1"}')
    end
  end

  def test_client_patch_cronjob
    client = ::RubyKubernetesController::Client.new("localhost", "TOKEN", false)

    assert_raises Exception do
      client.patch_cronjob('default','cronjob', '[{ "op": "replace", "path": "/spec/path", "value": "testvalue" }]')
    end
  end

  def test_client_delete_cronjob
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false)

    assert_raises Exception do
      client.delete_cronjob('default',"cronjob", '{"kind": "CronJob","apiVersion":"batch/v1beta1"}')
    end
  end

  def test_client_check_valid_json
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false, true)

    exception0 = assert_raises Exception do
      client.delete_pod('default',"pod", '{"test": "test"}')
    end

    assert_equal('JSON entered instead of yaml file for a yaml client', exception0.message)

    exception1 = assert_raises Exception do
      client.delete_endpoint('default',"pod", '{"test": "test"}')
    end

    assert_equal('JSON entered instead of yaml file for a yaml client', exception1.message)

    exception2 = assert_raises Exception do
      client.delete_ingress('default',"pod", '{"test": "test"}')
    end

    assert_equal('JSON entered instead of yaml file for a yaml client', exception2.message)

    exception3 = assert_raises Exception do
      client.delete_namespace('default', '{"test": "test"}')
    end

    assert_equal('JSON entered instead of yaml file for a yaml client', exception3.message)
  end

  def test_client_yaml_file_to_json
    client = ::RubyKubernetesController::Client.new("localhost","TOKEN", false, true)
    file = 'testfile'

    exception0 = assert_raises Errno::ENOENT do
      client.delete_pod('default',"pod", file)
    end

    assert_equal("No such file or directory @ rb_sysopen - #{file}", exception0.message)

    exception1 = assert_raises Errno::ENOENT do
      client.delete_endpoint('default',"pod", file)
    end

    assert_equal("No such file or directory @ rb_sysopen - #{file}", exception1.message)

    exception2 = assert_raises Errno::ENOENT do
      client.delete_ingress('default',"pod", file)
    end

    assert_equal("No such file or directory @ rb_sysopen - #{file}", exception2.message)

    exception3 = assert_raises Errno::ENOENT do
      client.delete_namespace('default', file)
    end

    assert_equal("No such file or directory @ rb_sysopen - #{file}", exception3.message)

    assert_equal('', client.yaml_file_to_json(''))

  end

end
