class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, include: [:commodity, :user]
  end

  def show
    post = Post.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded Post', data: post}, status: :ok
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: {status: 'SUCCESS', message: 'Loaded Post', data: post}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Post Not Saved', data: post.errors}, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update_attributes(post_params)
      render json: {status: 'SUCCESS', message: 'Updated Post', data: post}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Post Not Updated', data: post.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: {status: 'SUCCESS', message: 'Deleted Post', data: post}, status: :ok
  end


  private

  def post_params
    params.permit(:user_id, :commodity_id, :date_needed, :date_posted, :priority)
  end

end
