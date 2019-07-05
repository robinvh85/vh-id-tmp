# frozen_string_literal: true

module Admin
  # HomeController
  class HomeController < BaseController
    include Admin::AdminHelper

    skip_before_action :authenticate_admin!

    def index; end
  end
end
