# frozen_string_literal: true

describe PexelsApiClient::Video do
  let!(:id)       { 1_616_168 }
  let!(:per_page) { 2 }
  let!(:page)     { 1 }
  let!(:query)    { 'people' }

  describe '#find' do
    it 'should respong with a single video' do
      VCR.use_cassette(:find_video) do
        video = PexelsApiClient::Video.find(id)

        expect(video.width).to            eq(1920)
        expect(video.height).to           eq(1080)
        expect(video.user.name).to        eq('Oleg Magni')
      end
    end
  end

  describe '#popular' do
    it 'should respond with many popular videos' do
      VCR.use_cassette(:popular_videos) do
        popular_videos = PexelsApiClient::Video.popular(per_page: per_page, page: page)

        expect(popular_videos.videos.size).to be > 0
        expect(popular_videos.videos.first).to be_a(PexelsApiClient::Video)
      end
    end
  end

  describe '#random' do
    it 'should respond with one random popular video' do
      VCR.use_cassette(:random_videos) do
        popular_videos = PexelsApiClient::Video.random(page: page)

        expect(popular_videos.videos.size).to  eq(1)
        expect(popular_videos.videos.first).to be_a(PexelsApiClient::Video)
      end
    end
  end

  describe '#search' do
    it 'should respond with videos related to a query' do
      VCR.use_cassette(:search_videos) do
        search_videos = PexelsApiClient::Video.search(per_page: per_page, page: page, query: query)

        expect(search_videos.videos.size).to be > 0
        expect(search_videos.videos.first).to be_a(PexelsApiClient::Video)
      end
    end
  end
end
