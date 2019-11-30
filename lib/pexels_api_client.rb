# frozen_string_literal: true

require 'flexirest'

module PexelsApiClient
  require 'pexels_api_client/errors'

  autoload :Base,   'pexels_api_client/base'
  autoload :Photo,  'pexels_api_client/photo'
  autoload :Video,  'pexels_api_client/video'
  autoload :Config, 'pexels_api_client/config'

  BASE_URL = 'https://api.pexels.com/v1'

  def self.config
    if block_given?
      yield(PexelsApiClient::Config)
    else
      PexelsApiClient::Config
    end
  end
end
