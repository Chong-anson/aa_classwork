class SessionsController < ApplicationController
  before_action :all_cats, only:[:new]
  before_action :require_login, only:[:index, :show]
  
  def new 
    render :new
  end 

  def create

    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user 
      log_in(user)
      redirect_to cats_url
    end 
  end 

  def destroy
    log_out
  end

    
end
