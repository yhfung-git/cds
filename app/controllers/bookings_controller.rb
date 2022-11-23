class BookingsController < ApplicationController
  # before_action :booking_params %i[]

  def index
    @bookings = current_user.bookings
    authorize @bookings
  end

  def new
    @cd = Cd.find(params[:cd_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.cd = Cd.find(params[:cd_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.update(booking_params)
    authorize @booking
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
