module Api
  module V1
    class CommodityController < ApplicationController

      def index
        commodities = Commodity.all
        render json: {status: 'SUCCESS', message: 'Loaded Commodities', data: commodities}, status: :ok
      end

      def show
        commodity = Commodity.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Commodity', data: commodity}, status: :ok
      end

      def create
        commodity = Commodity.new(commodity_params)

        if commodity.save
          render json: {status: 'SUCCESS', message: 'Saved Commodity', data: commodity}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Commodity Not Saved', data: commodity.errors}, status: :unprocessable_entity
        end
      end

      def update
        commodity = Commodity.find(params[:id])

        if commodity.update
          render json: {status: 'SUCCESS', message: 'Updated Commodity', data: commodity}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Commodity Not Updated', data: commodity.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        commodity = Commodity.find(params[:id])
        commodity.destroy
        render json: {status: 'SUCCESS', message: 'Deleted Commodity', data: commodity}, status: :ok
      end


      private

      def commodity_params
        params.permit(:type, :name, :price, :img_url)
      end

    end
  end
end
