# frozen_string_literal: true

module Admin
  class ApplicationsController < BaseController
    load_and_authorize_resource

    def index
    end
  end
end
