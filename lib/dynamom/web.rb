require 'sinatra/base'

module DynaMom
  class Web < Sinatra::Base
    get '/tables' do
      DB.tables.to_json
    end

    put '/tables' do
      json = request.body.read
      opts = JSON.parse(json, :symbolize_names => true)
      DB.create_table(opts)
    end

    delete '/tables/:name' do |name|
      DB.delete_table(name)
    end
  end
end
