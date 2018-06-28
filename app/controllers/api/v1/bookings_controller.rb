class Api::V1::BookingsController < ApplicationController

  def index
    bookings = Booking.all
    render json: {status: 'SUCCESS', message: 'Loaded Bookings', data: bookings}, status: :ok
  end

  def show
    booking = Booking.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded Booking', data: booking}, status: :ok
  end

  def create
    booking = Booking.new(booking_params)

    if booking.save
      render json: {status: 'SUCCESS', message: 'Loaded Booking', data: booking}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Booking Not Saved', data: booking.errors}, status: :unprocessable_entity
    end
  end

  def update
    booking = Booking.find(params[:id])
    if booking.update_attributes(booking_params)
      render json: {status: 'SUCCESS', message: 'Updated Booking', data: booking}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Booking Not Updated', data: booking.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    render json: {status: 'SUCCESS', message: 'Deleted Booking', data: booking}, status: :ok
  end


  private

  def booking_params
    params.permit(:user_id, :good_id, :date_needed, :date_bookinged, :priority)
  end

end
