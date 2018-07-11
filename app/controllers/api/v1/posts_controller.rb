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

  def get_user_commodities
    info = []
    posts = Post.all.select {|post| post.user_id.to_s == params[:user_id]}
    posts.each do |post|
      commodity = Commodity.all.find {|commodity| commodity.id == post.commodity_id}
      data = {id: post.id, commodity_type: commodity.commodity_type, commodity_name: commodity.name, commodity_price: commodity.price, img_url: commodity.img_url, date_needed: post.date_needed, date_posted: post.date_posted, priority: post.priority}
      info << data
    end
    render json: info
  end

  def get_user_posts
    posts = Post.all.select {|post| post.user_id.to_s == params[:user_id]}
    render json: posts
  end


  private

  def post_params
    params.permit(:user_id, :commodity_id, :date_needed, :date_posted, :priority, :location_id)
  end

end
