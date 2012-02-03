class Sound < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :user

  mount_uploader :file, SoundfileUploader

end
