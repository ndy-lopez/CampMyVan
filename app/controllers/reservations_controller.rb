class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:destroy]
  before_action :set_van, only: [:new, :show, :create]

  def index
    @client_reservations = Reservation.where(user: current_user)
    # @van = Van.find(params[:brand])
  end

  def my_owner_reservations
    @owner_reservations = current_user.owner_reservations
  end

  def show; end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.van_id = params[:van_id]
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
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
