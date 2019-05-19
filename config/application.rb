require_relative 'boot'

require 'rails/all'
# require 'lib/unauthorized_controller'
require_relative '../lib/strategies/password_strategy.rb'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VhId
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
      # manager.default_strategies :password_strategy, :basic_auth
      manager.default_strategies :password_strategy
      # manager.failure_app = Proc.new { |env| ['401', {'Content-Type' => 'application/json'}, { error: 'Unauthorized', code: 401 }] }
      manager.failure_app = ::UnauthorizedController
    end
  end
end
