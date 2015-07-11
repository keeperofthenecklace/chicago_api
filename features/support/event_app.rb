require 'sinatra'
require 'json'

class EventApp < Sinatra::Base
  set :data, ''

  get '/v1/events' do
    content_type :json
    EventApp.data.to_json
  end
end
