class RecruitmentPostscript < ApplicationRecord
  
  belongs_to :musician
  belongs_to :recruitment
  
  validates :musician_id, presence: true
  validates :recruitment_id, presence: true
  validates :postscript, presence: true, length: { maximum: 2000 }
end
