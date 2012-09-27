require 'spec_helper'
require 'rack/test'

require 'dynamom/web'

describe DynaMom::Web do
  include Rack::Test::Methods

  def app
    DynaMom::Web
  end

  describe 'GET /tables' do
    it 'returns ok' do
      get '/tables'
      last_response.should be_ok
    end

    it 'makes a call to DB.tables' do
      DynaMom::DB.should_receive(:tables) { [] }
      get '/tables'
    end

    it 'should return a JSON array' do
      DynaMom::DB.stub(:tables) { [] }
      get '/tables'
      last_response.body.should eq([].to_json)
    end
  end
end
