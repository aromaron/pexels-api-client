# PexelsApiClient

PexelsApiClient its a Ruby wrapper for the [Pexels](https://www.pexels.com) API. Please read Pexel's [documentation](https://www.pexels.com/api/documentation/) on how to start using their API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pexels_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pexels_api_client

## Usage

To start using the Pexel's API you'll first need to setup an [account](https://www.pexels.com/join/) on their site, once you have an account you will need to request an [Api Key](https://www.pexels.com/api/new/)

Now you can configure the gem with:

```ruby
PexelsApiClient.config do |config|
  config.api_key = '<API_KEY>'
end
```

#### Photo Methods

*  **Find**: If you have the id of a photo, you can retrieve the data of it.

```ruby
photo = PexelsApiClient::Photo.find(id)
photo.width # => 1400
photo.photographer # => John Doe
 # ...
```

*  **Curated**: Get a Curated list of trending photos. 

| **Param**     | **Description** |
| ------        | ------ |
| **per_page**  | Defines the number of results per page. (optional, default: 15, max: 80) |
| **page**      | Defines the number of the page. (optional, default: 1) | 

```ruby
curated_photos = PexelsApiClient::Photo.curated # => Fallback to default options
  -- or --
curated_photos = PexelsApiClient::Photo.curated(per_page: 5, page: 2) # => With custom options

curated_photos.photos # => [photo1, photo2,etc]
curated_photos.photos.first.photographer # => John Doe
 # ...
```

*  **Random**: Returns a random photo from the curated photos

```ruby
random_photo = PexelsApiClient::Photo.random

random_photo.photos # => [photo1]
random_photo.photos.first.photographer # => John Doe
 # ...
```

*  **Search**: Search for photos related to a query

| **Param**     | **Description** |
| ------        | ------ |
| **query**     | Get photos related to this query. (required) |
| **per_page**  | Defines the number of results per page. (optional, default: 15, max: 80) |
| **page**      | Defines the number of the page. (optional, default: 1) | 

```ruby
search_photos = PexelsApiClient::Photo.search(per_page: 5, page: 2, query: 'people')

search_photos.photos  # => [photo1, photo2,etc]
search_photos.photos.first.photographer # => John Doe
 # ...
```

#### Video Methods

*  **Find**: If you have the id of a video, you can retrieve the data of it.

```ruby
video = PexelsApiClient::Video.find(id)
video.width # => 1400
video.user.name # => John Doe
 # ...
```

*  **Popular**: Get a list of popular videos. 

| **Param**        | **Description** |
| ------           | ------ |
| **per_page**     | Defines the number of results per page. (optional, default: 15, max: 80) |
| **page**         | Defines the number of the page. (optional, default: 1) | 
| **min_width**    | The minimum width in pixels of the returned videos. (optional, default: "") |
| **max_width**    | The maximum width in pixels of the returned videos. (optional, default: "") | 
| **min_duration** | The minimum duration in seconds of the returned videos. (optional, default: "")|
| **max_duration** | The maximum duration in seconds of the returned videos. (optional, default: "") | 

```ruby
popular_videos = PexelsApiClient::Video.popular # => Fallback to default options
  -- or --
popular_videos = PexelsApiClient::Video.popular(per_page: 5, page: 2) # => With custom options

popular_videos.videos # => [video1, video2, etc]
popular_videos.videos.first.user.name # => John Doe
 # ...
```

*  **Random**: Returns a random video from the popular videos

```ruby
random_video = PexelsApiClient::Video.random

random_video.videos # => [photo1]
random_video.videos.first.user.name # => John Doe
 # ...
```

*  **Search**: Search for videos related to a query


| **Param**        | **Description** |
| ------           | ------ |
| **query**        | Get videos related to this query. (required) |
| **per_page**     | Defines the number of results per page. (optional, default: 15, max: 80) |
| **page**         | Defines the number of the page. (optional, default: 1) | 
| **min_width**    | The minimum width in pixels of the returned videos. (optional, default: "") |
| **max_width**    | The maximum width in pixels of the returned videos. (optional, default: "") | 
| **min_duration** | The minimum duration in seconds of the returned videos. (optional, default: "")|
| **max_duration** | The maximum duration in seconds of the returned videos. (optional, default: "") | 

```ruby
search_videos = PexelsApiClient::Video.search(per_page: 5, page: 2, query: 'people')

search_videos.videos # => [video1, video2,etc]
search_videos.videos.first.user.name # => John Doe
 # ...
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rspec spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pexels_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PexelsApiClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](http://contributor-covenant.org)
