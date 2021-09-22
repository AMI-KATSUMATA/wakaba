class Artwork < ApplicationRecord
  has_one_attached :artwork_image
  belongs_to :creator
  
  validates :creator_id, presence: true
  validates :description, length: { maximum: 1000 }
  validates :is_private, inclusion: { in: [true, false] }
end
