# frozen_string_literal: true

# BaseController
class BaseController < ApplicationController
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to login_path unless logged_in?
  end
end
