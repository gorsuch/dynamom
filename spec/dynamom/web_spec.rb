require 'spec_helper'
require 'rack/test'

require 'dynamom/web'

describe DynaMom::Web do
  include Rack::Test::Methods

  def app
    DynaMom::Web
  end

  describe 'GET /tables' do
    it 'returns 200' do
      DynaMom::DB.stub(:tables) { [] }
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

  describe 'PUT /tables/:name' do |name|
    let(:payload) { {:read => 1, :write => 1, :hash_key => 'id', :hash_key_type => 'string' } }

    it 'returns status 200' do
      DynaMom::DB.stub(:create_table) { }
      put '/tables/foo', payload
      last_response.should be_ok
    end

    it 'returns ok' do
      DynaMom::DB.stub(:create_table) { }
      put '/tables/foo', payload
      last_response.body.should eq('ok')
    end

    it 'makes a call to DB.create_table' do
      DynaMom::DB.should_receive(:create_table).with('foo', 1, 1, :hash_key => { :id => :string })
      put '/tables/foo', payload
    end
  end

  describe 'DELETE /tables/:name' do |name|
    it 'returns status 200' do
      DynaMom::DB.stub(:delete_table).with('foo')
      delete '/tables/foo'
      last_response.should be_ok
    end

    it 'returns ok' do
      DynaMom::DB.stub(:delete_table).with('foo')
      delete '/tables/foo'
      last_response.body.should eq('ok')
    end
  end
end
