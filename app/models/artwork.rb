class Artwork < ApplicationRecord
  has_one_attached :artwork_image
  belongs_to :creator
end
