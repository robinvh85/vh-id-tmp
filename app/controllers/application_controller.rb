# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include Admin::DeviseHelper

  layout :layout_by_resource

  private

  # Setting layout for devise pages
  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end

  # Setting for devise redirect after sign_in and sign_out
  def after_sign_in_path_for(resource)
    admin_users_path if resource.is_a?(AdminUser)
  end

  def after_sign_out_path_for(resource)
    admin_home_path if resource == :adminUser
  end
end
