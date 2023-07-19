

# To use minitest framwork
require 'minitest/reporters'
require 'minitest/autorun'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

class ActiveSupport::TestCase
  # Configure Database Cleaner
  DatabaseCleaner.strategy = :transaction

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests
  fixtures :users, :posts, :comments
end
 

