class CatsController < ApplicationController
  def index 
    @cats = Cat.all 
    render :index 
  end

  def show 
    cat = Cat.find(params[:id])
    @cats = [cat]
    render :show
    # render json: @cats
  end

  def new 
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def create
    @cats = [Cat.new(cat_params)]
    if @cats.first.save
      render :show
    else 
      render json: @cats.first.errors.full_messages, status: 422
    end
  end


  private 
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
