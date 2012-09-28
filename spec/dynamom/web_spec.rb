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
    let(:payload) { {:name => 'foo', :read => 1, :write => 1, :hash_key => { :id => :string }}.to_json }

    it 'returns ok' do
      DynaMom::DB.stub(:create_table) { }
      put '/tables', payload
      last_response.should be_ok
    end

    it 'makes a call to DB.create_table' do
      DynaMom::DB.should_receive(:create_table).with('foo', 1, 1, {'id'=> 'string'})
      put '/tables', payload
    end
  end

  describe 'DELETE /tables/:name' do |name|
    it 'returns ok' do
      DynaMom::DB.stub(:delete_table).with('foo')
      delete '/tables/foo'
      last_response.should be_ok
    end
  end
end
