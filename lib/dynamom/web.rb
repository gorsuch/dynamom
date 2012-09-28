require 'sinatra/base'

module DynaMom
  class Web < Sinatra::Base
    get '/tables' do
      DB.tables.to_json
    end

    put '/tables' do
      data = JSON.parse(request.body.read, :symbolize_names => true)
      DB.create_table(data)
    end

    delete '/tables/:name' do |name|
      DB.delete_table(name)
    end
  end
end
