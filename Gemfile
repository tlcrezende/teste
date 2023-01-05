source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
# gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem "devise_token_auth", "~> 1.2"
gem "active_model_serializers", "~> 0.10.13"
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# gem 'rack-cors'
gem "rubocop", "~> 1.42"
gem "kaminari", "~> 1.2"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.1"
  gem "rspec-rails", "~> 6.0"
end

group :test do
  gem "database_cleaner-active_record", "~> 2.0"
  gem "shoulda-matchers", "~> 5.3"
  gem "simplecov", "~> 0.22.0", require: false
end

group :development do
end
