class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :log_out, :log_in, :require_login, :all_cats
  
  def require_login
    redirect_to new_session_url unless logged_in?
  end 

  def all_cats 
    redirect_to cats_url if logged_in?
  end 

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def log_in(user)
    session[:session_token] = user.reset_session_token!     
  end 
  
  def log_out 
    current_user.reset_session_token!
    session[:session_token] = nil 
    redirect_to new_session_url
  end
  
  def logged_in?
    !!current_user
  end
end
