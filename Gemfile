source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'

gem 'decent_exposure'
gem 'jsonapi-serializer'
gem 'oj'
gem 'pagy'
gem 'searchkick'

gem 'pry-rails'

gem 'image_processing', '~> 1.2'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 5'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
