# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    include Admin::AdminHelper
    load_and_authorize_resource

    def index
    end
  end
end
