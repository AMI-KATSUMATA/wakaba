class Creator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :entries, dependent: :destroy
  has_many :issues,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_recruitments, through: :favorites, source: :recruitment
  has_many :favorited_musicians, through: :favorites, source: :musician
  has_many :messages, dependent: :destroy
  has_many :artworks, dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_creator_id', dependent: :destroy
  has_many :visitor_creators, through: :active_notifications, source: :visitor_creator
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_creator_id', dependent: :destroy
  has_many :visited_creators,through: :passive_notifications, source: :visited_creator

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :phone_number, presence: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, length:{ maximum: 15 }
  validates :nickname, length:{ maximum: 20 }
  validates :phone_number, numericality: {only_integer: true},
                           length: { minimum: 10, maximum: 11 }
  validates :schedule, length: { maximum: 200 }
  validates :price, length: { maximum: 200 }
  validates :introduction, length: { maximum: 1000 }
  validates :is_deleted, inclusion: { in: [true, false] }

  # 退会済みユーザーを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end