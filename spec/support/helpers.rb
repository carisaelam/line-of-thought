module Helpers
  def sign_in_as(user)
    login_as(user, scope: :user)
  end
end
