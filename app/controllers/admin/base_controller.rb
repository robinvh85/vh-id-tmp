# frozen_string_literal: true

module Admin
  # BaseController
  class BaseController < ApplicationController
    include Admin::AdminHelper
    layout 'admin'

    prepend_before_action :authenticate_admin!

    def current_ability
      @current_ability ||=  AdminAbility.new(current_admin)
    end
  end
end
