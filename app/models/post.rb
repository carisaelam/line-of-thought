class Post < ApplicationRecord
  validates :body, length: { maximum: 100 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
end
