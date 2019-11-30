# frozen_string_literal: true

describe PexelsApiClient::Video do
  let!(:id)       { 12_345 }
  let!(:per_page) { 2 }
  let!(:page)     { 1 }
  let!(:query)    { 'people' }

  shared_examples 'a valid video' do
    it { expect(video).to be_a(PexelsApiClient::Video) }
    it { expect(video).to respond_to(:id) }
    it { expect(video).to respond_to(:width) }
    it { expect(video).to respond_to(:height) }
    it { expect(video).to respond_to(:url) }
    it { expect(video).to respond_to(:image) }
    it { expect(video).to respond_to(:full_res) }
    it { expect(video).to respond_to(:tags) }
    it { expect(video).to respond_to(:duration) }
    it { expect(video).to respond_to(:user) }
    it { expect(video).to respond_to(:video_files) }
  end

  describe '#find' do
    let!(:video) { PexelsApiClient::Video.find(id) }

    it_behaves_like 'a valid video'
    it { expect(video.width).to            eq(1920) }
    it { expect(video.height).to           eq(1080) }
    it { expect(video.user.name).to        eq('John Doe') }
  end

  describe '#popular' do
    it 'should respond with many popular videos' do
      popular_videos = PexelsApiClient::Video.popular(per_page: per_page, page: page)

      expect(popular_videos.videos.size).to be > 0
      expect(popular_videos.videos.first).to be_a(PexelsApiClient::Video)
    end
  end

  describe '#random' do
    it 'should respond with one random popular video' do
      popular_videos = PexelsApiClient::Video.random

      expect(popular_videos.videos.size).to  eq(1)
      expect(popular_videos.videos.first).to be_a(PexelsApiClient::Video)
    end
  end

  describe '#search' do
    it 'should respond with videos related to a query' do
      search_videos = PexelsApiClient::Video.search(per_page: per_page, page: page, query: query)

      expect(search_videos.videos.size).to be > 0
      expect(search_videos.videos.first).to be_a(PexelsApiClient::Video)
    end
  end
end
