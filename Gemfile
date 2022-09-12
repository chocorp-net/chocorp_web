source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

# Minimum stuff
gem "rails", "~> 7.0"
gem "sprockets-rails", "~> 3.4"
gem "sqlite3", "~> 1.5", git: "https://github.com/sparklemotion/sqlite3-ruby"
gem "puma", "~> 5.6"
gem "importmap-rails", "~> 1.1"
gem "turbo-rails", "~> 1.1"
gem "stimulus-rails", "~> 1.1"
gem "jbuilder", "~> 2.11"
gem "bootsnap", "~> 1.13", require: false
gem "sass-rails", "~> 6.0"

group :development do
    gem 'web-console'
    gem 'foreman'
end

group :test do
    gem "capybara", "~> 3.37"
    gem "selenium-webdriver"
    gem "webdrivers"
    gem "rspec"
    gem "rubocop"
    gem "rubocop-rails"
end

