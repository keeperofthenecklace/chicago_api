# Load the event_app file from the support directory.
# The file inherits from sinatra base class which serve us the web server.
#
require File.join(File.dirname(__FILE__), 'event_app')
require 'rack/test'

module AppHelper
  # We use Rack-test to return a Rack application.
  def app
    EventApp
  end
end

# Wiring Rack-test.
# Rack::Test::Methods defines the HTTP simulation methods like get.
# AppHelper tells rack-test which rack to use (not HTTP server).
World(Rack::Test::Methods, AppHelper)
