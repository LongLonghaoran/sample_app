class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login_required
  include SessionsHelper

  private
  def login_required
    if current_user.blank?
      redirect_to "/auth/joshid"
    end
  end
end
