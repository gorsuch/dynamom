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
      hash_key = data['hash_key']

      DB.create_table(name, read, write, hash_key)
    end

    delete '/tables/:name' do |name|
      DB.delete_table(name)
    end
  end
end
