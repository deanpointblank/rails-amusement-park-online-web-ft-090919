class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :authentication_required, :current_user

  def authentication_required
    if !logged_in?
        redirect_to root_path
    end
  end

  def logged_in?
      !!current_user
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
