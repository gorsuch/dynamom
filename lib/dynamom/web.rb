require 'sinatra/base'

module DynaMom
  class Web < Sinatra::Base
    get '/tables' do
      DB.tables.to_json
    end
  end
end
