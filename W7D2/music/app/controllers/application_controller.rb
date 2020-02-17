class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_log_in, :logged_in?, :log_out, :log_in!

  def current_user
    @current_user = User.find_by(session_token: session[:session_token])
    @current_user
  end 

  def require_log_in 
    redirect_to new_session_url unless logged_in?
  end

  def logged_in? 
    !!current_user
  end 

  def log_in!(user) 
    session[:session_token] = user.reset_session_token! 
  end 

  def log_out 

    current_user.reset_session_token! 
    session[:session_token] = nil
  end 
end
