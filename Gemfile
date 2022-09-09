source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


ruby '3.1.1'

# Minimum stuff
gem "rails", "~> 7.0"
gem "sprockets-rails", "~> 3.4"
gem "sqlite3", "~> 1.5"
gem "puma", "~> 5.6"
gem "importmap-rails", "~> 1.1"
gem "turbo-rails", "~> 1.1"
gem "stimulus-rails", "~> 1.1"
gem "jbuilder", "~> 2.11"
gem "bootsnap", "~> 1.13", require: false

group :development, :test do
    #gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
    gem 'web-console'
end

group :test do
    gem "capybara", "~> 3.37"
    gem "selenium-webdriver"
    gem "webdrivers"
    gem "rspec"
end

gem "sass-rails", "~> 6.0"
