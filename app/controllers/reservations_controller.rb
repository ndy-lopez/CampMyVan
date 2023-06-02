class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:destroy, :show]
  before_action :set_van, only: [:new, :create]

  def index
    @client_reservations = Reservation.where(user: current_user)
    # @van = Van.find(params[:brand])
  end

  def show;
  end

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

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.accept = params[:accept].to_i.zero? ? false : true
    if @reservation.save
      redirect_to my_owner_reservations_path
    else
      render :my_owner_reservations_path
    end
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
