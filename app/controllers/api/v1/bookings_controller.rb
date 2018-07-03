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
    booking = Booking.all.find {|booking| booking.location_id.to_s == params[:id]}
    booking.destroy
    render json: {status: 'SUCCESS', message: 'Deleted Booking', data: booking}, status: :ok
  end

  def get_user_bookings
    info = []
    bookings = Booking.all.select { |booking| booking.user_id.to_s == params[:id].to_s}
    bookings.each do |booking|
      location = Location.all.find {|location| location.id == booking.location_id}
      data = {lat: location.latitude, lon: location.longitude, name: location.name, desc: location.description, date: booking.date, time: booking.time, id: booking.id}
      info << data
    end
    render json: {status: 'SUCCESS', message: 'Returned bookings', data: info}, status: :ok
  end


  private

  def booking_params
    params.permit(:user_id, :location_id, :date, :time)
  end

end
