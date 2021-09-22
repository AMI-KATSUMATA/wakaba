class Recruitment < ApplicationRecord

  belongs_to :musician
  has_many :entries, dependent: :destroy
  has_one :issue
  has_many :favorites, dependent: :destroy
  has_many :favorited_creators, through: :favorites, source: :creator
  has_many :recruitment_postscripts, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :musician_id, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :detail, presence: true, length: { maximum: 2000 }
  validates :price, presence: true, numericality: {only_integer: true}
  validates :is_private, inclusion: { in: [true, false] }
  validates :is_closed, inclusion: { in: [true, false] }

  # entryテーブルに引数creator_idが存在するか
  def entried_by?(creator)
    entries.where(creator_id: creator.id).exists?
  end
  # favoriteテーブルにcreator_idが存在するか
  def favorited_by?(creator)
    favorites.where(creator_id: creator.id).exists?
  end


end
