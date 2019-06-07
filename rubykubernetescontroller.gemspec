
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubykubernetescontroller/version"

Gem::Specification.new do |spec|
  spec.name          = "rubykubernetescontroller"
  spec.version       = RubyKubernetesController::VERSION
  spec.authors       = ["Shivansh Vij (ShivanshVij)", "Matthew Grech (mgrech)", "Zack Livingston (ZackLivingston)"]
  spec.email         = ["shivanshvij@outlook.com", "mgrech97@gmaii.com", "15zel@queensu.ca"]

  spec.summary       = %q{RubyKubernetesController is a Ruby Client Library for interacting with existing Kubernetes Clusters.}
  spec.description   = <<-EOF
                          RubyKubernetesController allows users to interact with the core Kubernetes APIs natively from within their Ruby
                          applications. This library is compatible with all leading Kubernetes Instances, including OpenShift Kubernetes, 
                          Azure Kubernetes Service, Amazon EKS, Google Kubernetes Service, IBM Kubernetes Service, and Rancher Orchestrated Kubernetes. 
                          This library also supports yaml ingestion for creating, patching, updating, or deleting existing Kubernetes types, 
                          including Pods, Services, Deployments, Endpoints, and Ingresses. Our documentation also contains complete examples for 
                          all operation types.
                        EOF
  spec.homepage      = "https://github.com/IBM/ruby-kubernetes-controller/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/IBM/ruby-kubernetes-controller/"
    spec.metadata["changelog_uri"] = "https://github.com/IBM/ruby-kubernetes-controller/blob/master/CHANGELOG.md"
    spec.metadata["documentation_uri"] = "https://github.com/IBM/ruby-kubernetes-controller/blob/master/DOCUMENTATION.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.required_ruby_version = '>= 2.0.0'
end
