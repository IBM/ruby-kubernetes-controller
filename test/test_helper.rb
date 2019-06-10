$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ruby-kubernetes-controller"

require "minitest"
require "minitest/autorun"
require "minitest/ci"

if ENV["CIRCLECI"]
  Minitest::Ci.report_dir = "test/reports"
end