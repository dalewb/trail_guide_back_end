class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: {status: 'SUCCESS', message: 'Loaded Users', data: users}, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded User', data: user}, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: {status: 'SUCCESS', message: 'Loaded User', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'User Not Saved', data: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: {status: 'SUCCESS', message: 'Updated User', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'User Not Updated', data: user.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {status: 'SUCCESS', message: 'Deleted User', data: user}, status: :ok
  end

  def show_user_locations
    user = User.find(params[:id])
    locations = user.locations
    render json: {status: 'SUCCESS', message: 'Loaded Locations', data: locations}, status: :ok
  end


  private

  def user_params
    params.permit(:user_type, :username, :gender, :start_date)
  end

end
