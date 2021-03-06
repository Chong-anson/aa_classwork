class BandsController < ApplicationController
  def create
    band = Band.new(band_params)
    if band.save 
      redirect_to bands_url 
    else 
      flash[:errors] = band.errors.full_messages 
      redirect_to new_bands_url
    end 
  end 

  def new
    @band = Band.new
    render :new
  end 

  def update 
    @band = Band.find(params[:id])
    if @band && @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else 
      flash[:errors] = @band.errors.full_messages
      render :edit
    end 
  end 
  
  def edit 
    @band = Band.find_by(@params[:id])
    if @band
      render :edit
    else 
      flash.now[:errors] = ["Band not found!"]
      redirect_to bands_url
    end 
  end 

  def destroy 
    band = Band.find(params[:id])
    band.destroy
    redirect_to bands_url
  end 


  def index 
    @bands = Band.all
    render :index
  end 

  def show 
    @band = Band.find_by(params[:id])
    if @band 
      render :show 
    else 
      redirect_to bands_url 
    end 
  end 

  private 
  def band_params
    params.require(:band).permit(:name)
  end
  
end
