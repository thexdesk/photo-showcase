class HomeController < ApplicationController
  def index
    response = F00px.get('photos')
    json = JSON.parse(response.body)
    @photos = json['photos'].map do |photo|
      Photo.new photo['id'], photo['name'], photo['image_url']
    end
  end
end
