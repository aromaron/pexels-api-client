# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pexels_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'pexels_api_client'
  spec.version       = PexelsApiClient::VERSION
  spec.authors       = ['Nora Gabriela Alvarado']
  spec.email         = ['noragmora@gmail.com']

  spec.summary       = 'This gem is used to access the Pexels API.'
  spec.description   = 'Using this gem allows you to make requests to the Pexels API endpoints.'
  spec.homepage      = 'https://gitlab.com/aromaron/pexels_api_client'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://gitlab.com/aromaron/pexels_api_client'
  spec.metadata['changelog_uri'] = 'https://gitlab.com/aromaron/pexels_api_client/blob/master/CHANGELOG'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '~> 2.6.3'

  spec.add_runtime_dependency 'flexirest',          '~> 1.8.6'
  spec.add_runtime_dependency 'json',               '~> 2.2.0'
  spec.add_runtime_dependency 'rest-client',        '~> 2.1.0'

  spec.add_development_dependency 'bump',           '~> 0.8.0'
  spec.add_development_dependency 'bundler',        '~> 2.0'
  spec.add_development_dependency 'codecov',        '~> 0.1.10'
  spec.add_development_dependency 'rake',           '~> 10.0'
  spec.add_development_dependency 'rspec',          '~> 3.9.0'
  spec.add_development_dependency 'rubocop',        '~> 0.77.0'
  spec.add_development_dependency 'vcr',            '~> 5.0.0'
  spec.add_development_dependency 'webmock',        '~> 3.7.6'
end
