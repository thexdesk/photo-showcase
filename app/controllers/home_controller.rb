class HomeController < ApplicationController
  def index
    @photos = PhotoService.new.run!
  end
end
