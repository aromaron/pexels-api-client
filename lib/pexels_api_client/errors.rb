# frozen_string_literal: true

module PexelsApiClient
  PexelsApiClientError = Class.new StandardError
  BadRequestError = Class.new StandardError
  ServerError = Class.new StandardError
  ApiKeyError = Class.new StandardError
  NotApiKeyError = Class.new ArgumentError
end
