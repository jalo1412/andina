class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentUser
  before_action :set_user
end
