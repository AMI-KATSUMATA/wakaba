class Issue < ApplicationRecord
  has_one :recruitment
  belongs_to :creator
  belongs_to :musician
end
