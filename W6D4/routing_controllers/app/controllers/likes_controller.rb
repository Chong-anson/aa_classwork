class LikesController < ApplicationController
  def index
    if params[:user_id]
      result = User.find(params[:user_id]).likes
    elsif params[:artwork_id]
      result = Artwork.find(params[:artwork_id]).likes
    elsif params[:comment_id]
      result = Comment.find(params[:comment_id]).likes
    end
    
    render json: result
  end
end
