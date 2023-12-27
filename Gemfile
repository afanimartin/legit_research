source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.6"

gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg"
gem "sqlite3"
gem "puma", "~> 5.0"
gem "avo", ">= 3.0.1.beta9", source: "https://packager.dev/avo-hq/"
gem "dotenv-rails"
gem "devise"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
gem "strscan", "3.0.4"
gem "ransack"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'capistrano', '~> 3.17'
  gem 'capistrano-rails', '~> 1.6', '>= 1.6.2'
  gem 'capistrano-passenger', '~> 0.2.1'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'ed25519', '~> 1.3'
  gem 'bcrypt_pbkdf', '~> 1.1'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
