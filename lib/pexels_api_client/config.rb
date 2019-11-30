# frozen_string_literal: true

module PexelsApiClient
  module Config
    class << self
      attr_reader :app_id, :api_key, :base_url

      def reset
        @app_id = nil
        @api_key = nil
        @base_url = PexelsApiClient::BASE_URL
      end

      def app_id=(app_id)
        @app_id = app_id
        set_api_auth_credentials
      end

      def api_key=(api_key)
        @api_key = api_key
        set_api_auth_credentials
      end

      def base_url=(base_url)
        @base_url = base_url
        set_api_auth_credentials
      end

      private

      def set_api_auth_credentials
        Flexirest::Base.base_url = base_url
        Flexirest::Base.api_auth_credentials(app_id, api_key)
        Flexirest::Base.request_body_type = :json
      end
    end

    reset
  end
end
