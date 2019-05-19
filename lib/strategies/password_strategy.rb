require 'warden'

class PasswordStrategy < ::Warden::Strategies::Base
  def valid?
    (params["username"] && params["password"]).present?
  end

  def authenticate!
    user = User.find_by_username params[:username]
    if user.nil? || !user.authenticate(params[:password])
      fail!()
    else
      success! user
    end
  end
end
