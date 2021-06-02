class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { in: 1..200 }
  belongs_to :user

  # フォロー機能
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
end
