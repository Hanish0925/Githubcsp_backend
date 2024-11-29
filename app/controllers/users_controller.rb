# app/controllers/api/v1/users_controller.rb
module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: [:edit, :update, :destroy]
      before_action :set_user, only: [:show, :edit, :update, :destroy]
      before_action :authorize_user, only: [:edit, :update, :destroy]

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: { message: "User created successfully", user: @user }, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: { message: "User updated successfully", user: @user }, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @user.destroy
          render json: { message: "User deleted successfully" }, status: :ok
        else
          render json: { errors: "Error deleting user" }, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find_by(id: params[:id])
        unless @user
          render json: { errors: "User not found" }, status: :not_found
        end
      end

      def authorize_user
        unless current_user == @user
          render json: { errors: "You are not authorized to perform this action" }, status: :forbidden
        end
      end

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
