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
      flash[:notice] = "Your booking has been added!"
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    flash[:notice] = "Your booking has been edited!"
    redirect_to bookings_path
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Your booking has been deleted!"
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
