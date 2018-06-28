class Api::V1::LocationsController < ApplicationController

  def index
    locations = Location.all
    render json: {status: 'SUCCESS', message: 'Loaded Locations', data: locations}, status: :ok
  end

  def show
    location = Location.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded Location', data: location}, status: :ok
  end

  def create
    location = Location.new(location_params)

    if location.save
      render json: {status: 'SUCCESS', message: 'Loaded Location', data: location}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Location Not Saved', data: location.errors}, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.permit(:user_id, :good_id, :date_needed, :date_locationed, :priority)
  end

end
