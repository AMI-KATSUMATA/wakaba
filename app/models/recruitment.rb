class Recruitment < ApplicationRecord
  
  belongs_to :musician
  has_many :entries, dependent: :destroy
  has_one :issue
  
  # entryテーブルに引数creator_idが存在するか
  def entried_by?(creator)
    entries.where(creator_id: creator.id).exists?
  end
end
