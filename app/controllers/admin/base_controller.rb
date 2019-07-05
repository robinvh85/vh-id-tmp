# frozen_string_literal: true

module Admin
  # BaseController
  class BaseController < ApplicationController
    include Admin::AdminHelper

    layout 'admin'

    prepend_before_action :authenticate_admin!
  end
end
