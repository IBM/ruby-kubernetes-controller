$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rubykubernetescontroller"

require "minitest"
require "minitest/autorun"
require "minitest/ci"

if ENV["CIRCLECI"]
  Minitest::Ci.report_dir = "#{ENV["CIRCLE_TEST_REPORTS"]}/reports"
end