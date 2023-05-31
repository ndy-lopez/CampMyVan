class VansController < ApplicationController
  before_action :set_van, only: [:show, :create]
  def index
    @vans = Van.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude
      }
    end
  end

  def show

  end

  # ------------------

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(vans_params)

    if @van.save
      redirect_to vans_path, notice: "saved!"
    else
      render :new, status: 422
    end
  end

  # ------------------

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def vans_params
    params.require(:van).permit(:model, :brand, :price, :photo)
  end

end
