class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end
end
