require 'sinatra/base'

module DynaMom
  class Web < Sinatra::Base
    get '/tables' do
      DB.tables.to_json
    end

    put '/tables' do
      json = request.body.read
      data = JSON.parse(json)

      name = data['name']
      read = data['read'] || 1
      write = data['write'] || 1
      opts = data['opts']

      DB.create_table(name, read, write, opts)
    end

    delete '/tables/:name' do |name|
      DB.delete_table(name)
    end
  end
end
