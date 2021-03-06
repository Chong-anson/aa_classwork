class UsersController < ApplicationController
  def index
    if params[:username]
      user = User.find_by(username: params[:username])
      render json: user
    else
      users = User.all 
      render json: users
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show 
    user = User.find(params[:id])
    render json: user
  end

  def update 
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user 
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy 
    user = User.find(params[:id])
    if user.destroy
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorites 
    user = User.find(params[:id])
    artworks = user.artworks.where(artworks: {favorite: true}) + user.shared_artworks.where(artwork_shares: {favorite: true})

    render json: artworks

  end
  private
  def user_params 
    params.require(:user).permit(:username)
  end
end
