require 'spec_helper'
require 'yaml'

expected_routes = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'expected_routes.yml'))

expected_routes.each do |route, expected|
  RSpec.describe route do
    it {is_expected.to route_to_service(expected["service"]).with_path(expected["path"])}
  end
end
