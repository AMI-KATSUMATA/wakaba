class Message < ApplicationRecord
  belongs_to :creator, optional: true
  belongs_to :musician, optional: true
  belongs_to :issue
  
end
