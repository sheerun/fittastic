class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    facebook_data = request.env["omniauth.auth"]
 
    user = Facebook.user_from_facebook_data(facebook_data, current_user)
    if user.save!
      sign_in_and_redirect user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook")
    else
      redirect_to root_url, :alert => "Couldn't login through Facebook"
    end
  end
end
