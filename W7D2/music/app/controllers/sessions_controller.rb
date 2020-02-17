class SessionsController < ApplicationController
  def new
    render :new 
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    return redirect_to new_session_url unless @user
    log_in!(@user)
    redirect_to user_url(@user)
  end
  
  def destroy
    log_out
    redirect_to new_session_url
  end
end
