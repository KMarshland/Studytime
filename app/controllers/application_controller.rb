class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  helper_method :current_user
  helper_method :gohome
  helper_method :is_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def gohome
    if !is_home
      redirect_to '/'
    end

  end

  def is_admin
    @is_admin = @current_user.is_admin
  end

end
