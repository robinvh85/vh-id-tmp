# frozen_string_literal: true

# Admin
module Admin
  # DeviseHelper
  module DeviseHelper
    extend ActiveSupport::Concern

    included do
      helper_method :current_admin, :authenticate_admin!

      def current_admin
        current_adminUser
      end

      def authenticate_admin!
        authenticate_adminUser!
      end
    end
  end
end
