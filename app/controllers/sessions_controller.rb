class SessionsController < ApplicationController
  layout 'application'

  # include SessionsHelper

  skip_before_action :authenticate!

  def login
    if request.post?
      # user = User.find_by(username: params[:username])
      # if user && user.authenticate(params[:password])
      #   log_in(user)
      #   flash.notice = "Login Successfully"
      #   redirect_to users_path
      # else
      #   flash.notice = "Login fails! Please try again"
      # end

      authenticate!
      flash.notice = "Login Successfully"
      redirect_to users_path
    end
  end

  def destroy
    # log_out
    warden.logout
    redirect_to root_path
  end
end