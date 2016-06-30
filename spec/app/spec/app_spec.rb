require 'spec_helper'

EXPECTED_ROUTES = {
  "/login"    => {service: "authentication", path: "/login"},
  "/messages" => {service: "inbox",          path: "/messages"}
}

EXPECTED_ROUTES.each do |route, expected|
  RSpec.describe route do
    it {is_expected.to route_to_service(expected[:service]).with_path(expected[:path])}
  end
end
