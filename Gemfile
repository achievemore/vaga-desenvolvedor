source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.1.2'

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'puma'
gem 'rails', '~> 7.0'
gem 'sqlite3', platform: :ruby

group :development, :test do
  gem 'debug', '~> 1.0'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'factory_bot'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.5'
  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
