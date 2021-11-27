require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chocorp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    # Add compression
    config.middleware.use Rack::Deflater

    # https
    config.hosts << "www.chocorp.net"
    config.hosts << "chocorp.net"
    config.force_ssl = false
    config.ssl_options = { redirect: { status: 307, port: 443 } }
  end
end
