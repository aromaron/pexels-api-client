# frozen_string_literal: true

module PexelsApiClient
  class Video < PexelsApiClient::Base
    get :find,    '/videos/videos/:id'
    get :popular, '/videos/popular', defaults: { per_page: 15, page: 1, min_width: '', max_width: '', min_duration: '', max_duration: '' }
    get :random,  '/videos/popular', defaults: { per_page: 1, page: rand(1..1000), min_width: '', max_width: '', min_duration: '', max_duration: '' }
    get :search,  '/videos/search', defaults: { per_page: 15, page: 1, min_width: '', max_width: '', min_duration: '', max_duration: '' }, required: [:query]
  end
end
