# frozen_string_literal: true

require 'sinatra/base'

class FakePexels < Sinatra::Base
  # Fake Photo Endpoints
  get '/v1/photos/search' do
    content_type :json
    status 200
    search_photos(per_page: params[:per_page], page: params[:page], query: params[:query]).to_json
  end

  get '/v1/photos/curated' do
    content_type :json
    status 200
    return curated(per_page: params[:per_page], page: params[:page]).to_json if params[:per_page].to_i > 1

    random_curated(per_page: params[:per_page], page: params[:page]).to_json
  end

  get '/v1/photos/:id' do
    content_type :json
    status 200
    photo(id: params[:id]).to_json
  end

  # Fake Video Endpoints
  get '/v1/videos/videos/:id' do
    content_type :json
    status 200
    video(id: params[:id]).to_json
  end

  get '/v1/videos/popular' do
    content_type :json
    status 200
    return popular(per_page: params[:per_page], page: params[:page]).to_json if params[:per_page].to_i > 1

    random_popular(per_page: params[:per_page], page: params[:page]).to_json
  end

  get '/v1/videos/search' do
    content_type :json
    status 200
    search_videos(per_page: params[:per_page], page: params[:page], query: params[:query]).to_json
  end

  private

  # Photo Objects

  def photo(_args = {})
    {
      width: 1000,
      height: 1000,
      url: 'https://www.pexels.com/photo/12345',
      photographer: 'Name',
      src: {
        original: 'https://original_photo.jpg',
        large: 'https://large_photo.jpg',
        large2x: 'https://large2x_photo.jpg',
        medium: 'https://medium_photo.jpg',
        small: 'https://small_photo.jpg',
        portrait: 'https://portrait_photo.jpg',
        landscape: 'https://landscape_photo.jpg',
        tiny: 'https://tiny_photo.jpg'
      }
    }
  end

  def curated(_args = {})
    {
      page: 1,
      per_page: 15,
      total_results: 236,
      url: 'https://api.pexels.com/v1/curated?per_page=2&page=1',
      next_page: 'https://api.pexels.com/v1/search/?page=2&per_page=2',
      photos: [
        photo,
        photo
      ]
    }
  end

  def random_curated(_args = {})
    {
      page: 1,
      per_page: 15,
      total_results: 236,
      url: 'https://api.pexels.com/v1/curated?per_page=2&page=1',
      next_page: 'https://api.pexels.com/v1/search/?page=2&per_page=2',
      photos: [
        photo
      ]
    }
  end

  def search_photos(_args = {})
    {
      page: 1,
      per_page: 15,
      total_results: 236,
      url: 'https://www.pexels.com/search/example%20query/',
      next_page: 'https://api.pexels.com/v1/search/?page=2&per_page=15&query=example+query',
      photos: [
        photo,
        photo
      ]
    }
  end

  # Video Objects

  def video(args = {})
    {
      id: args[:id],
      width: 1920,
      height: 1080,
      url: 'https://www.pexels.com/video/example-12345/',
      image: 'https://images.pexels.com/videos/12345/free-video-12345.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb',
      full_res: nil,
      tags: [],
      duration: 7,
      user: {
        id: 1,
        name: 'John Doe',
        url: 'https://www.pexels.com/@john-doe'
      },
      video_files: [
        {
          id: 1,
          quality: 'hd',
          file_type: 'video/mp4',
          width: 1280,
          height: 720,
          link: 'https://player.vimeo.com/external/example'
        },
        {
          id: 2,
          quality: 'hd',
          file_type: 'video/mp4',
          width: 1920,
          height: 1080,
          link: 'https://player.vimeo.com/external/example'
        }
      ]
    }
  end

  def popular(_args = {})
    {
      page: 1,
      per_page: 2,
      total_results: 10_609,
      url: 'https://www.pexels.com/videos/',
      videos: [
        video,
        video
      ]
    }
  end

  def random_popular(_args = {})
    {
      page: 1,
      per_page: 2,
      total_results: 10_609,
      url: 'https://www.pexels.com/videos/',
      videos: [
        video
      ]
    }
  end

  def search_videos(_args = {})
    {
      page: 1,
      per_page: 2,
      total_results: 2056,
      url: 'https://www.pexels.com/search/videos/example/',
      videos: [video, video]
    }
  end
end
