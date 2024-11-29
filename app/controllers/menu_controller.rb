# app/controllers/api/v1/menu_controller.rb
module Api
  module V1
    class MenuController < ApplicationController
      before_action :set_menu, only: [:show, :update, :destroy]

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      def index
        @menus = Menu.all
        render json: @menus, status: :ok
      end

      def show
        render json: @menu, status: :ok
      end

      def create
        @menu = Menu.new(menu_params)
        if @menu.save
          render json: { message: 'Menu was successfully created', menu: @menu }, status: :created
        else
          render json: { errors: @menu.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @menu.update(menu_params)
          render json: { message: 'Menu was successfully updated', menu: @menu }, status: :ok
        else
          render json: { errors: @menu.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @menu.destroy
        render json: { message: 'Menu was successfully deleted' }, status: :ok
      end

      private

      def set_menu
        @menu = Menu.find(params[:id])
      end

      def menu_params
        params.require(:menu).permit(:week_start_date, :breakfast_items, :lunch_items, :dinner_items)
      end

      def record_not_found
        render json: { error: 'Menu not found' }, status: :not_found
      end
    end
  end
end
