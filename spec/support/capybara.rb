require 'selenium-webdriver'
require 'capybara/rspec'

Capybara.register_driver :selenium do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 240

  args = %w[
    disable-default-apps
    disable-extensions
    disable-infobars
    disable-gpu
    disable-popup-blocking
    headless
    no-default-browser-check
    no-first-run
    no-sandbox
    no-proxy-server
    start-fullscreen
    --window-size=1600,1200
  ]

  http_client = Selenium::WebDriver::Remote::Http::Default.new
  options = Selenium::WebDriver::Chrome::Options.new(args:)
  options.logging_prefs = { browser: 'ALL' }
  options.add_preference('w3c', false)
  driver_options = {
    browser: :chrome,
    options:,
    http_client:,
    clear_local_storage: true,
    clear_session_storage: true
  }

  Capybara::Selenium::Driver.new(app, **driver_options)
end

Capybara.default_driver = :selenium
Selenium::WebDriver.logger.level = :info
Selenium::WebDriver.logger.output = 'selenium.log'

RSpec.configure do |config|
  config.include Capybara::DSL
end
