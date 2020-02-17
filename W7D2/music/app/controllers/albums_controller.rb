class AlbumsController < ApplicationController
  before_action :require_log_in, only: :new

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    render :new 
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit 
  end

  def show
    @album = Album.find_by(params[:id])
    render :show 
  end

  def create
    album = Album.new(album_params)
    if album.save 
      redirect_to album_url(album) 
    else 
      flash.now[:errors] = @album.errors.full_messages 
      redenr :new
    end 
  end 
  
  def update 
    album = ALbum.find_by(id: params[:id])
    if album.update(album.params)
      redirect_to album_url(album)
    else 
      flash.now[:errors] = album.errors.full_messages 
      render :edit 
    end 
  end 
  
  def destroy
    album = ALbum.find_by(params[:id])
    album.destroy 
    redirect_to band_url(album.band_id)
  end 

  private 
  def album_params 
    params.require(:album).permit(:title, :yr, :album_type, :band_id) 
  end

end

