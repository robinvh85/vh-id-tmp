module WardenHelper extend ActiveSupport::Concern
  included do
    helper_method :warden, :logged_in?, :current_user

    prepend_before_action :authenticate!
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!
    # binding.pry
    warden.authenticate! :password_strategy
  end
end
