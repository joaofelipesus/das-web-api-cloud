source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.2', '>= 7.0.2.2'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

# Validate, generate and format CPF/CNPJ numbers. Include command-line tools.
gem "cpf_cnpj"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # RSpec for Rails 5+
  gem 'rspec-rails', '~> 5.0.0'
  # Simple one-liner tests for common Rails functionality
  gem 'shoulda-matchers', '~> 5.0'
  # Factory Bot hearts Rails
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # Generate Entity-Relationship Diagrams for Rails applications
  gem 'rails-erd'
end

group :test do
  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'database_cleaner-active_record'
  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov', require: false
  # Simple console output formatter for SimpleCov
  gem 'simplecov-console', require: false
end
