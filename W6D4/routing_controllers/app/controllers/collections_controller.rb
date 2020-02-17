class CollectionsController < ApplicationController
  def index 
    if params[:user_id] 
      user = User.find(params[:user_id])      
      result = user.collections
    elsif params[:artwork_id ]
      artwork = Artwork.find(params[:artwork_id])
      result = artwork.collections
    end

      render json: result 
  end

  def show 
    collection = Collection.find(params[:id]).artworks
    render json: collection 
  end
end
