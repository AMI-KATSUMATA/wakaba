class Favorite < ApplicationRecord

  belongs_to :creator
  belongs_to :musician, optional: true
  belongs_to :recruitment, optional: true
  
  validates :creator_id, presence: true
  validates :subject, presence: true
  
    # favoriteテーブルにcreator_idが存在するか
  def favorited_by?(creator)
    favorites.where(creator_id: creator.id).exists?
  end
end
