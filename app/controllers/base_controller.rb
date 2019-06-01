# frozen_string_literal: true

# BaseController
class BaseController < ApplicationController
  before_action :authenticate_user!
end
