# frozen_string_literal: true

require 'pexels_api_client'
require 'webmock/rspec'

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.before(:suite) do
    PexelsApiClient.config do |conf|
      conf.api_key = 'API_KEY'
      conf.base_url = 'https://api.pexels.com/v1'
    end
  end

  config.before(:each) do
    stub_request(:any, /api.pexels.com/).to_rack(FakePexels)
  end
end
