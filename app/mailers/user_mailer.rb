class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email(user)
    @user = user
    @url = "http://line-of-thought-production.up.railway.app/"
    mail(to: @user.email, subject: "Welcome to Line of Thought!")
  end
end
