# frozen_string_literal: true

# Overall controller for app
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
end
