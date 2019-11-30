# frozen_string_literal: true

describe PexelsApiClient::Photo do
  let!(:id)       { 12_345 }
  let!(:per_page) { 2 }
  let!(:page)     { 1 }
  let!(:query)    { 'example' }

  shared_examples 'a valid photo' do
    it { expect(photo).to be_a(PexelsApiClient::Photo) }
    it { expect(photo).to respond_to(:width) }
    it { expect(photo).to respond_to(:height) }
    it { expect(photo).to respond_to(:url) }
    it { expect(photo).to respond_to(:photographer) }
    it { expect(photo).to respond_to(:src) }
  end

  describe '#find' do
    let!(:photo) { PexelsApiClient::Photo.find(id) }

    it_behaves_like 'a valid photo'
    it { expect(photo.width).to         eq(1000) }
    it { expect(photo.height).to        eq(1000) }
    it { expect(photo.url).to           eq('https://www.pexels.com/photo/12345') }
    it { expect(photo.photographer).to  eq('Name') }
    it { expect(photo.src.original).to  eq('https://original_photo.jpg') }
    it { expect(photo.src.large).to     eq('https://large_photo.jpg') }
    it { expect(photo.src.large2x).to   eq('https://large2x_photo.jpg') }
    it { expect(photo.src.medium).to    eq('https://medium_photo.jpg') }
    it { expect(photo.src.small).to     eq('https://small_photo.jpg') }
    it { expect(photo.src.portrait).to  eq('https://portrait_photo.jpg') }
    it { expect(photo.src.landscape).to eq('https://landscape_photo.jpg') }
    it { expect(photo.src.tiny).to      eq('https://tiny_photo.jpg') }
  end

  describe '#curated' do
    it 'should respond with many curated photos' do
      curated_photos = PexelsApiClient::Photo.curated(per_page: per_page, page: page)

      expect(curated_photos.photos.size).to be > 0
      expect(curated_photos.photos.first).to be_a(PexelsApiClient::Photo)
    end
  end

  describe '#random' do
    it 'should respond with one random curated photo' do
      curated_photos = PexelsApiClient::Photo.random

      expect(curated_photos.photos.size).to  eq(1)
      expect(curated_photos.photos.first).to be_a(PexelsApiClient::Photo)
    end
  end

  describe '#search' do
    it 'should respond with photos related to a query' do
      search_photos = PexelsApiClient::Photo.search(per_page: per_page, page: page, query: query)

      expect(search_photos.photos.size).to be > 0
      expect(search_photos.photos.first).to be_a(PexelsApiClient::Photo)
    end
  end
end
