require 'sinatra/base'

module DynaMom
  class Web < Sinatra::Base
    get '/tables' do
      DB.tables.to_json
    end

    put '/tables/:name' do |name|
      read, write, hash_key, hash_key_type, range_key, range_key_type = params[:read].to_i, params[:write].to_i, params[:hash_key], params[:hash_key_type], params[:range_key], params[:range_key_type]

      opts = {}
      if hash_key and hash_key_type
        opts[:hash_key] = { hash_key.to_sym => hash_key_type.to_sym }
      end

      if range_key and range_key_type
        opts[:range_key] = { range_key.to_sym => range_key_type.to_sym } 
      end
      
      DB.create_table(name, read, write, opts)
      'ok'
    end

    delete '/tables/:name' do |name|
      DB.delete_table(name)
      'ok'
    end
  end
end
