# frozen_string_literal: true

module PexelsApiClient
  module Config
    class << self
      attr_reader :api_key, :base_url

      def reset
        @api_key = nil
        @base_url = PexelsApiClient::BASE_URL
      end

      def api_key=(api_key)
        @api_key = api_key
        set_api_auth
      end

      def base_url=(base_url)
        @base_url = base_url
        set_api_auth
      end

      private

      def set_api_auth
        Flexirest::Base.base_url = base_url
        Flexirest::Base.request_body_type = :json

        Flexirest::Base.faraday_config do |faraday|
          faraday.adapter(:net_http)
          faraday.options.timeout       = 10
          faraday.headers['User-Agent'] = "Flexirest/#{Flexirest::VERSION}"
          faraday.headers['Authorization'] = @api_key
        end
      end
    end

    reset
  end
end
