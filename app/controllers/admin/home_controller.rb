# frozen_string_literal: true

module Admin
  # HomeController
  class HomeController < BaseController
    skip_before_action :authenticate_admin!

    def index; end
  end
end
