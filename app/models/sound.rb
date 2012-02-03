require 'open-uri'
require 'rack/utils'
class Sound < ActiveRecord::Base

  NABALIVE_URL = "http://nabalive.com/nabaztags/#{ENV['NABAZTAG_KEY']}/play?url="

  validates_presence_of :title

  belongs_to :user

  has_many :soundboard_inclusions

  mount_uploader :file, SoundfileUploader

  def play_on_nabaztag
    return open(NABALIVE_URL + Rack::Utils.escape(file)).read
  rescue OpenURI::HTTPError => e
    return e
  end

end
