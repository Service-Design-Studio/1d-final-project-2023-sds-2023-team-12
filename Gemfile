source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.5"
gem "dotenv-rails"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 4.3.5"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Gemfile for shrine
gem 'jquery-turbolinks'

#Devise user authentication
gem 'devise', '~> 4.9', '>= 4.9.2'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Open AI gem file for AI feature
gem "ruby-openai"

gem 'shrine', '~> 3.4'
gem 'image_processing', '~> 1.12', '>= 1.12.2'
# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem 'jquery-rails'
gem 'haml'
#gem 'protected_attributes'
gem 'activemodel', '~> 7.0.5'

# google cloud storage gem
gem "google-cloud-storage", "~> 1.11", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'capybara'
  gem 'byebug'
  gem 'database_cleaner'
  gem 'sqlite3'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end


# Ruby interface to the PostgreSQL RDBMS. It works with PostgreSQL 9.3 and later, only in production will we use pg
group :production do
  gem 'pg', '~> 1.5.3' # for gcloud deployment
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'minitest'


end