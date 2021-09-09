class Favorite < ApplicationRecord

  belongs_to :creator
  belongs_to :musician, optional: true
  belongs_to :recruitment, optional: true
end
