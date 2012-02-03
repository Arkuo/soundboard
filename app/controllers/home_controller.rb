class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to soundboard_path and return
    end
  end

  def soundboard
    @sounds = Sound.all
  end

end
