class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :github ]

  has_many :posts, dependent: :destroy

  def self.from_omniauth(auth)
    email = auth.info.email || "default@example.com"  # Default email or handle missing email
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name   # Assuming you have a full_name attribute
      user.avatar_url = auth.info.image  # Assuming you have an avatar_url attribute
    end
  end
end
