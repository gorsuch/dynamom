module DynaMom
  module Config
    extend self

    def env!(key)
      ENV[key] || raise("#{key} not found in ENV")
    end

    def aws_access_key_id
      env!('AWS_ACCESS_KEY_ID')
    end

    def aws_secret_access_key
      env!('AWS_SECRET_ACCESS_KEY')
    end
  end
end
