class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth = request.env["omniauth.auth"]
    Rails.logger.debug("Omniauth Auth Data: #{auth.inspect}")

    @user = User.from_omniauth(auth)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Github"
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:alert] = "GitHub login failed: #{flash[:alert]}"
      redirect_to new_user_registration_url
    end
  end
end
