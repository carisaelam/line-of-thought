class Post < ApplicationRecord
  validates :body, length: { maximum: 100 }
end
