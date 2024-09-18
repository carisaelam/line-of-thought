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
    email = auth.info.email || "default@example.com"
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.email = email
    user.password = Devise.friendly_token[0, 20] if user.new_record?
    user.full_name = auth.info.name
    user.avatar_url = auth.info.image

    # Check if the email is taken
    if user.email.present? && User.exists?(email: user.email) && user.new_record?
      # Handle the case where email already exists
      Rails.logger.error("Email #{email} is already taken.")
      nil
    else
      user.save
      user
    end
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
