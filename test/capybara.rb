# For Capybara implementation

require 'capybara/rails'

Capybara.configure do |config|
  config.default_driver = :rack_test
  config.default_max_wait_time = 10 # Increase the default wait time if needed
end
