module AdminHelper
  def current_admin
    current_adminUser
  end

  def authenticate!
    authenticate_adminUser!
  end
end
