
module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?

      # if @user.persisted?
      #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      #   set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      # else
      #   session["devise.github_data"] = request.env["omniauth.auth"]
      #   redirect_to new_user_registration_url
      # end
    end

    def google2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    end

    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    end

    def failure
      redirect_to root_path
    end
  end
end
