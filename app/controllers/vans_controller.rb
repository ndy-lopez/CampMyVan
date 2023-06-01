class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @vans = Van.all
      # The `geocoded` scope filrs only flats with coordinates
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
    @van.user_id = current_user.id
    if @van.save
      redirect_to van_path(@van), notice: "saved!"
    else

      render :new, status: :unprocessable_entity
    end

  end

  # ------------------

  def edit

  end

  def update
    if @van.update(vans_params)
      redirect_to @van
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @van.destroy
    redirect_to vans_path, notice: "Van listing was successfully removed"
  end

  private

  def set_van
    @van = Van.find(params[:id])
  end

  def vans_params
    params.require(:van).permit(:model, :brand, :price, :photo)
  end
end
