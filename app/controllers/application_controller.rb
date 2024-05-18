class ApplicationController < ActionController::API
  include Pundit::Authorization
  protect_from_forgery with: :exception
end
