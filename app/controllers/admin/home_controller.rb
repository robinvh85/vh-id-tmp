# frozen_string_literal: true

module Admin
  class HomeController < BaseController
    skip_before_action :authenticate!

    def index
      # binding.pry
    end
  end
end
