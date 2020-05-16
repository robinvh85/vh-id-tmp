# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include Admin::AdminHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def current_ability
  #   binding.pry
  #   if current_user
  #     @current_ability ||=  Ability.new(current_user)
  #   elsif current_admin
  #     @current_ability ||=  AdminAbility.new(current_admin)
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  # Redirect to url after loginned
  def after_sign_in_path_for(_resource)
    home_index_path
  end

  # Redirect to url after logout
  def after_sign_out_path_for(_resource)
    root_path
  end

  rescue_from CanCan::AccessDenied do
    render '/errors/access_denied'
  end
end
