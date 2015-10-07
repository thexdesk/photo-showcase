class Photo
  attr_accessor :id, :name, :image_url

  def initialize(id, name, image_url)
    @id = id
    @name = name
    @image_url = image_url
  end
end
