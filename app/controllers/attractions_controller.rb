class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attractions_params)

    if @attraction.save!
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  private

  def attractions_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end