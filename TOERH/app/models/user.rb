class User < ActiveRecord::Base
    has_many :resources

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
      end
    end

    def self.update_user(user, auth)
        user.name = auth["info"]["name"]
        user.auth_token = SecureRandom.hex
        user.token_expires = Time.now + 3.hour
    end

end
