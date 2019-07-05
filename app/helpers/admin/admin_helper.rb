# frozen_string_literal: true

module Admin
  module AdminHelper
    def current_admin
      current_adminUser
    end

    def authenticate_admin!
      authenticate_adminUser!
    end
  end
end
