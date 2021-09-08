class Musician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :recruitments, dependent: :destroy

  # 退会ずみのユーザーを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
