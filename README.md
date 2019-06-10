# Ruby Kubernetes Controller

Current Build: [![CircleCI](https://circleci.com/gh/IBM/ruby-kubernetes-controller.svg?style=svg)](https://circleci.com/gh/IBM/ruby-kubernetes-controller)

`Ruby Kubernetes Controller` is a Client-Side library which allows users to 
interact with core Kubernetes APIs natively from within their 
Ruby applications. This library is compatible with all leading Kubernetes 
Instances, including OpenShift Kubernetes, Azure Kubernetes Service, 
Amazon EKS, Google Kubernetes Service, IBM Kubernetes Service, and Rancher 
Orchestrated Kubernetes. This library also supports yaml ingestion 
for creating, patching, updating, or deleting existing Kubernetes 
types, including Pods, Services, Deployments, Endpoints, and Ingresses. 
Our documentation also contains complete examples for all operation types.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-kubernetes-controller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-kubernetes-controller

## Usage

#### For usage instructions please see our [Documentation][DOCUMENTATION]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/IBM/ruby-kubernetes-controller][HOMEPAGE]. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby Kubernetes Controller project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rubykubernetescontroller/blob/master/CODE_OF_CONDUCT.md).

[HOMEPAGE]: https://github.com/IBM/ruby-kubernetes-controller
[DOCUMENTATION]: https://github.com/IBM/ruby-kubernetes-controller/blob/master/Documentation/DOCUMENTATION.md