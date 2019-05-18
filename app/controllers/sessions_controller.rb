class SessionsController < ApplicationController
  layout 'application'

  include SessionsHelper

  def login
    if request.post?
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        log_in(user)
        flash.notice = "Login Successfully"
        redirect_to users_path
      else
        flash.notice = "Login fails! Please try again"
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end