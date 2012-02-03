class User < ActiveRecord::Base
  has_many :sounds


  def self.find_or_create_from_auth_hash(hash)
    user = User.find_or_initialize_by_uid(hash['uid'], {email: hash['info']['email']})
    user.token = hash['credentials']['token']
    user.save
    user
  end
end
