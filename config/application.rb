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
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Chicagofest
  class Application < Rails::Application
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
