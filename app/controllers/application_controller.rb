# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  # Setting layout for devise pages
  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end

  # Redirect to url after loginned
  def after_sign_in_path_for(resource)
    admin_users_path if resource.is_a?(AdminUser)
    products_path
  end

  # Redirect to url after logout
  def after_sign_out_path_for(resource)
    admin_home_path if resource == :adminUser
    root_path
  end
end
