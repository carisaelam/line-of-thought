class Post < ApplicationRecord
  validates :body, length: { maximum: 100, message: :too_long }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  def liked?(user)
    !!self.likes.find { |like| like.user_id == user.id }
  end
end
