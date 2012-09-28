module DynaMom
  module DB
    extend self

    def create_table(data={})
      name = data[:name] 
      read = data[:read] || 1
      write = data[:write] || 1
      range_key = nil
      
      if hash_key = data[:hash_key]
        hash_key = { hash_key.keys.first => hash_key.values.first.to_sym }
      end

      if range_key = data[:range_key]
        range_key = { range_key.keys.first => range_key.values.first.to_sym } 
      end

      opts = {}
      opts[:hash_key] = hash_key
      opts[:range_key] = range_key

      dynamo.tables.create(name, read, write, opts)
    end

    def delete_table(name)
      dynamo.tables[name].delete
    end

    def dynamo
      @dynamo ||= AWS::DynamoDB.new(access_key_id: Config.aws_access_key_id, secret_access_key: Config.aws_secret_access_key)
    end

    def tables
      dynamo.tables.map do |t| 
        t.load_schema
      end.map do |t|
        { :name => t.name, :read_capacity_units => t.read_capacity_units, :write_capacity_units => t.write_capacity_units, :status => t.status }
      end
    end
  end
end
