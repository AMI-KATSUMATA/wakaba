class Musician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :recruitments, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_creators, through: :favorites, source: :creator
  has_many :recruitment_postscripts, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_musician_id', dependent: :destroy
  has_many :visitor_musicians,through: :active_notifications, source: :visitor_musician
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_musician_id', dependent: :destroy
  has_many :visited_musicians, through: :passive_notifications, source: :visited_musician
  
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :phone_number, presence: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, length:{ maximum: 15 }
  validates :nickname, length:{ maximum: 20 }
  validates :phone_number, numericality: {only_integer: true},
                           length: { minimum: 10, maximum: 11 }
  validates :introduction, length: { maximum: 1000 }
  validates :is_deleted, inclusion: { in: [true, false] }

  # 退会ずみのユーザーを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  # favoriteテーブルにcreator_idが存在するか
  def favorited_by?(creator)
    favorites.where(creator_id: creator.id).exists?
  end
end
