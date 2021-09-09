class Favorite < ApplicationRecord
  
  belongs_to :creator
  belongs_to :musician
  belongs_to :recruitment
end
