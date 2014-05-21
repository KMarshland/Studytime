class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  helper_method :current_user
  helper_method :go_home
  helper_method :is_admin?
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?

  end

  def check_logged_in
    unless logged_in?
      flash[:error] = "Please log in"
      go_home
      false
    end
  end

  def authorize
    unless is_admin?
      flash[:error] = "Admins only"
      go_home
      false
    end
  end

  def go_home
    if !is_home
      redirect_to '/'
    end

  end

  def is_admin?
    @is_admin = @current_user.is_admin?
  end

end
