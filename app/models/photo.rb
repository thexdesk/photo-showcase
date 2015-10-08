class Photo
  attr_accessor :id, :name, :image_url, :width, :height, :description

  def initialize(id, name, image_url, width, height, description)
    @id = id
    @name = name
    @image_url = image_url
    @width = width
    @height = height
    @description = description
  end
end
