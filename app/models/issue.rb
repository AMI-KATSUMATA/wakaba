class Issue < ApplicationRecord
  belongs_to :recruitment
  belongs_to :creator
  belongs_to :musician
  has_many :messages, dependent: :destroy
  
  # status
  enum status: { 未着手: 0, 作成中: 1, 作成完了: 2}
end
