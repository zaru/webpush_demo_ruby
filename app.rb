# frozen_string_literal: true

require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    @public_key = File.read('./vapid_keys/public_key')
    @private_key = File.read('./vapid_keys/private_key')
    erb :index
  end
end
