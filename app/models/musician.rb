class Musician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image

  # 退会ずみのユーザーを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
