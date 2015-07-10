require File.expand_path('../boot', __FILE__)

###############################################################
# rails/all includes all the sub-frameworks like
# I've included in this API in hope that I can start he server.
# In the future, I intend to require the specific sub-frameworks
# ###############################################################
require 'rails/all'
# # config/application.rb
# # require "active_record/railtie"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# # require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chicagofest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Add Cross-origin resource sharing
    config.middleware.insert_before 'Rack::Runtime', 'Rack::Cors' do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :put, :post, :patch, :delete, :options]
      end
    end
  end
end
