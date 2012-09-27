module DynaMom
  module DB
    extend self

    def create_table(name, read, write, hash_key)
    end

    def delete_table(name)
    end

    def dynamo
      @dynamo ||= AWS::DynamoDB.new(access_key_id: Config.aws_access_key_id, secret_access_key: Config.aws_secret_access_key)
    end

    def tables
    end
  end
end
