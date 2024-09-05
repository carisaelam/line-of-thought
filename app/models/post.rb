class Post < ApplicationRecord
  validates :body, length: { maximum: 100 }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
