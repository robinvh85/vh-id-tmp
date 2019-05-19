class UnauthorizedController < ActionController::Metal
  include ActionController::UrlFor
  include ActionController::Redirecting
  include Rails.application.routes.url_helpers
  include Rails.application.routes.mounted_helpers

  delegate :flash, to: :request

  class << self
    def call env
      @respond ||= action :respond
      @respond.call env
    end
  end

  def respond
    unless request.get?
      request.env["warden.options"][:message] = "Logged in fail!"
      flash.alert = request.env["warden.options"][:message]
    end
    redirect_to root_path
  end
end
