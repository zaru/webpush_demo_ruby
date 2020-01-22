# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require 'webpush'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/push' do
    params = JSON.parse(request.body.read)
    p params
    Webpush.payload_send(
      message: JSON.generate(params['message']),
      endpoint: params['endpoint'],
      p256dh: params['p256dh'],
      auth: params['auth'],
      vapid: {
        subject: 'mailto:sender@example.com',
        public_key: public_key,
        private_key: private_key
      },
      ssl_timeout: 5,
      open_timeout: 5,
      read_timeout: 5
    )
    status 200
    body ''
  end

  private

  helpers do
    def public_key
      @public_key ||= File.read('./vapid_keys/public_key')
    end

    def private_key
      @private_key ||= File.read('./vapid_keys/private_key')
    end
  end
end
