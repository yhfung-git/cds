class BookingsController < ApplicationController
  # before_action :booking_params %i[]

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @cd = Cd.find(params[:cd_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
