# frozen_string_literal: true

# BaseController
class BaseController < ApplicationController
  before_action :authenticate_user!

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
