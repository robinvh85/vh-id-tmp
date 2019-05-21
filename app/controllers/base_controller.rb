class BaseController < ApplicationController
  before_action :authenticate_user!

  def authenticate_user!
    binding.pry
    unless logged_in?
      redirect_to login_path
    end
  end
end
