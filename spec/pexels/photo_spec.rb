# frozen_string_literal: true

describe PexelsApiClient::Photo do
  let!(:id)       { 3_171_200 }
  let!(:per_page) { 2 }
  let!(:page)     { 1 }
  let!(:query)    { 'people' }

  describe '#find' do
    it 'should respong with a single photo' do
      VCR.use_cassette(:find_photo) do
        photo = PexelsApiClient::Photo.find(id)

        expect(photo.width).to         eq(4036)
        expect(photo.height).to        eq(2696)
        expect(photo.url).to           eq('https://www.pexels.com/photo/family-having-meal-at-the-table-3171200/')
        expect(photo.photographer).to  eq('cottonbro')
        expect(photo.src.original).to  eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg')
        expect(photo.src.large).to     eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
        expect(photo.src.large2x).to   eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
        expect(photo.src.medium).to    eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&h=350')
        expect(photo.src.small).to     eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&h=130')
        expect(photo.src.portrait).to  eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800')
        expect(photo.src.landscape).to eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200')
        expect(photo.src.tiny).to      eq('https://images.pexels.com/photos/3171200/pexels-photo-3171200.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280')
      end
    end
  end

  describe '#curated' do
    it 'should respond with many curated photos' do
      VCR.use_cassette(:curated_photos) do
        curated_photos = PexelsApiClient::Photo.curated(per_page: per_page, page: page)
        expect(curated_photos.photos.size).to be > 0
        expect(curated_photos.photos.first).to be_a(PexelsApiClient::Photo)
      end
    end
  end

  describe '#random' do
    it 'should respond with one random curated photo' do
      VCR.use_cassette(:random_photos) do
        random_photos = PexelsApiClient::Photo.random(page: page)
        expect(random_photos.photos.size).to  eq(1)
        expect(random_photos.photos.first).to be_a(PexelsApiClient::Photo)
      end
    end
  end

  describe '#search' do
    it 'should respond with photos related to a query' do
      VCR.use_cassette(:search_photos) do
        search_photos = PexelsApiClient::Photo.search(per_page: per_page, page: page, query: query)

        expect(search_photos.photos.size).to be > 0
        expect(search_photos.photos.first).to be_a(PexelsApiClient::Photo)
      end
    end
  end
end
