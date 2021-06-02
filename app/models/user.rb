class User < ApplicationRecord
  validates :name, presence: true, uniqueness:true, length: {in: 2..20}
  validates :introduction,length: { maximum: 50}


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy

  # フォロー機能
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得

end
