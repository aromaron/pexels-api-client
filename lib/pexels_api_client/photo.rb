# frozen_string_literal: true

module PexelsApiClient
  class Photo < PexelsApiClient::Base
    get :curated, '/photos/curated', defaults: { per_page: 15, page: 1 }
    get :random,  '/photos/curated', defaults: { per_page: 1, page: rand(1..1000) }
    get :search,  '/photos/search', defaults: { per_page: 15, page: 1 }, required: [:query]
    get :find,    '/photos/:id'
  end
end
