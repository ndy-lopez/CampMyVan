class VansController < ApplicationController

  def index
    @vans = Van.all
  end

  def show
  end

  # ------------------

  def new

  end

  def create

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
end
