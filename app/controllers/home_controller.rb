class HomeController < ApplicationController
  def index
    photos = F00px.get('photos').body
    render json: photos
  end
end
