class Creator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :entries, dependent: :destroy
  has_many :issues,dependent: :destroy
  has_many :favorites, dependent: :destroy


  # 退会済みユーザーを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end