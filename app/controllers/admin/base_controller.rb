# frozen_string_literal: true

module Admin
  class BaseController < ActionController::Base
    include AdminHelper

    layout 'admin'

    prepend_before_action :authenticate!
  end
end
