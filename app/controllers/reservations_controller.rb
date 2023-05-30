class ReservationsController < ApplicationController
  before_action :set_reservation, only: :destroy
  before_action :set_van, only: [:index, :new, :create]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.van = @van
    if @reservation.save
      redirect_to van_path(@van)
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to van_path(@reservation.van), status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_van
    @van = Van.find(params[:van_id])
  end
end
