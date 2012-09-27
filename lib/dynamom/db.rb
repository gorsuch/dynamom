module DynaMom
  module DB
    extend self

    def create_table(name, read, write, opts={})
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
