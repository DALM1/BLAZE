class FileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Définit les transformations d'images si nécessaire
  version :thumbnail do
    process resize_to_fill: [150, 150]
  end
end
