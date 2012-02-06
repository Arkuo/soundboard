class User < ActiveRecord::Base
  has_many :sounds
  has_many :soundboard_inclusions

  has_many :soundboard_sounds, :through => :soundboard_inclusions, :source => :sounds

  def self.find_or_create_from_auth_hash(hash)
    if email_restriction = ENV['APPS_RESTRICTION']
      return nil unless hash['info']['email'].match(/#{email_restriction}$/)
    end
    user = User.find_or_initialize_by_uid(hash['uid'], {email: hash['info']['email']})
    user.token = hash['credentials']['token']
    user.save
    user
  end
end
