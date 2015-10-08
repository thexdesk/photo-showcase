class PhotoService
  def self.default_builder
    builder = F00px::Api::Photos::Builder.new
    builder.images(20).options(
      rpp: 100
    )
  end

  def initialize(builder: PhotoService.default_builder)
    @builder = builder
  end

  def run!
    response = F00px.popular(@builder)
    json = JSON.parse(response.body)

    json['photos'].map do |photo|
      Photo.new(
        photo['id'],
        photo['name'],
        photo['image_url'].first,
        photo['width'],
        photo['height'],
        photo['description']
      )
    end
  end
end
