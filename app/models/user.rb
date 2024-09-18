class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :github ]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :following_users

  before_create :set_default_avatar_url
  # after_initialize :set_default_avatar_url, if: :new_record?

  def self.from_omniauth(auth)
    email = auth.info.email
    user = User.where(email: email).first_or_initialize do |u|
      u.provider = auth.provider
      u.uid = auth.uid
      u.full_name = auth.info.name
      u.avatar_url = auth.info.image
      u.password = Devise.friendly_token[0, 20]
    end
    user.save if user.new_record?
    user
  end




  def follow(followee)
    if self != followee
      self.followees << followee
    end
  end

  def unfollow(followee)
    self.followees.destroy(followee)
  end

  def following?(followee)
    self.followees.include?(followee)
  end

  private



  def set_default_avatar_url
    self.avatar_url ||= "https://picsum.photos/200?random=#{SecureRandom.hex(10)}"
  end
end
