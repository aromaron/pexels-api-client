# frozen_string_literal: true

module PexelsApiClient
  class Photo < PexelsApiClient::Base
    get :curated, 'v1/curated', defaults: { per_page: 15, page: 1 }
    get :random,  'v1/curated', defaults: { per_page: 1, page: rand(1..1000) }
    get :search,  'v1/search', defaults: { per_page: 15, page: 1 }, required: [:query]
    get :find,    'v1/photos/:id'
  end
end
