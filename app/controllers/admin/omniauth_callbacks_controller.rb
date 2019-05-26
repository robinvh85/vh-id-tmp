module Admin
  class OmniauthCallbacksController < BaseController
    skip_before_action :authenticate_admin!

    def index
      send params[:provider]
    end
    
    def github
      # binding.pry
      model = Authorization.find_by(provider: auth_params[:provider], uid: auth_params[:uid])
      if model.nil?
        admin = AdminUser.find_or_create_by!({email: auth_params[:info][:email]})
        # admin = AdminUser.new({email: auth_params[:info][:email] || 'empty', password: 'empty'}) if admin.nil?
        # admin.skip_password_validation = true
        binding.pry
        model = Authorization.create!(provider: auth_params[:provider], uid: auth_params[:uid], user_id: admin.id)
      end

      sign_in_and_redirect admin
    end

    # def facebook
    #   generic_callback :facebook
    # end

    # def generic_callback provider
    #   @identity = User.from_omniauth(request.env["omniauth.auth"])

    #   @user = @identity || current_user
    #   if @user.persisted?
    #     sign_in_and_redirect @user, event: :authentication
    #     set_flash_message :notice, :success, kind: provider.capitalize if
    #       is_navigational_format?
    #   else
    #     session["devise.#{provider}_data"] = request.env["omniauth.auth"]
    #     redirect_to new_user_registration_url
    #   end
    # end

    def failure
      redirect_to root_path
    end

    private
    def auth_params
      request.env["omniauth.auth"]
    end

  end
end