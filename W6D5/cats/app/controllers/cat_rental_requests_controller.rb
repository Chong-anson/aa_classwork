class CatRentalRequestsController < ApplicationController
  def new
    @crr = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @crr = [CatRentalRequest.new(crr_params)]
    if @crr.first.save
      render plain: "Succeed"
    else
      render json: @crr.first.errors.full_messages, status: 422
    end
  end

  private
  def crr_params
    params[:crr][:status] = "PENDING"
    params.require(:crr).permit(:cat_id, :start_date, :end_date, :status)
  end
end
