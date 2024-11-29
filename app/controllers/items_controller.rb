# app/controllers/api/v1/items_controller.rb
module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: [:show, :update, :destroy]

      def index
        @items = Item.all
        render json: @items, status: :ok
      end

      def show
        render json: @item, status: :ok
      end

      def create
        @item = Item.new(item_params)
        if @item.save
          render json: { message: 'Item was successfully created.', item: @item }, status: :created
        else
          render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @item.update(item_params)
          render json: { message: 'Item was successfully updated.', item: @item }, status: :ok
        else
          render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @item.destroy
        render json: { message: 'Item was successfully deleted.' }, status: :ok
      end

      private

      def set_item
        @item = Item.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Item not found' }, status: :not_found
      end

      def item_params
        params.require(:item).permit(:name, :description, :calories, :protein, :carbohydrates, :fat, :rating)
      end
    end
  end
end
