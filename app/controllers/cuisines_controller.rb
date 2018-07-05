class CuisinesController < ApplicationController
  def show
    id = params[:id]
    @cuisine = Cuisine.find(id)
  end
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to cuisine_path(@cuisine)
    else
      render "new"
    end
  end
  
  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end