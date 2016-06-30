require 'httparty'
require 'json'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

RSpec::Matchers.define :route_to_service do |service|
  match do |route|
    resp = HTTParty.get("http://gateway#{route}")
    return false if resp.code != 200
    actual = JSON.parse(resp.body)
    return actual["service"] == service && actual["path"] == path
  end

  chain :with_path, :path
end
