require 'sinatra/base'

module DynaMom
  class Web < Sinatra::Base
    get '/tables' do
      DB.tables.to_json
    end

    put '/tables/:name' do |name|
      data = JSON.parse(request.body.read, :symbolize_names => true)
      DB.create_table(name, data)
    end

    delete '/tables/:name' do |name|
      DB.delete_table(name)
    end
  end
end
