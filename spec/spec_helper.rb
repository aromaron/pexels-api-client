# frozen_string_literal: true

require 'pexels_api_client'
require 'vcr'
require 'webmock/rspec'
require 'simplecov'
require 'codecov'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Codecov

Dir['./spec/support/**/*.rb'].each { |f| require f }

PexelsApiClient.config do |config|
  config.api_key = 'qwerty123'
end

RSpec.configure do |config|
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/vcr'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :once }
end
