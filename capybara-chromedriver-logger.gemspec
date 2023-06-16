# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'capybara/chromedriver/logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'capybara-chromedriver-logger'
  spec.version       = Capybara::Chromedriver::Logger::VERSION
  spec.authors       = ['David Balatero']
  spec.email         = ['dbalatero@gmail.com']

  spec.summary       = 'Adds realtime console.log output to Capybara + Selenium + Chromedriver'
  spec.homepage      = 'https://github.com/dbalatero/capybara-chromedriver-logger'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capybara'
  spec.add_dependency 'matrix'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'gem-release'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'selenium-webdriver', '~> 4.9'
  spec.add_development_dependency 'stub_server', '~> 0.7.0'
  spec.add_development_dependency 'webdrivers'
  spec.add_development_dependency 'webrick'

  spec.required_ruby_version = '>= 3.2.0'
end
