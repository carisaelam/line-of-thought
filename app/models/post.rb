class Post < ApplicationRecord
  validates :body, length: { maximum: 100 }

  belongs_to :user
end
