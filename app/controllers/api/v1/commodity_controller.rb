module Api
  module v1
    class CommodityController < ApplicationController

      def index
        commodities = Commodity.all
        render json {status: 'SUCCESS', message: 'Loaded Commodities', data:commodities}, status: :ok
      end

      def show

      end

      def create

      end

      def update

      end

      def destroy

      end


      private

      def commodity_params
        params.permit(:type, :name, :price, :img_url)
      end

    end
  end
end
