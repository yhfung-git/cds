class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.user = current_user
    @booking.cd = Cd.find(params[:cd_id])
  end

  def create
  end
end
