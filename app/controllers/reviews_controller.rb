# app/controllers/api/v1/reviews_controller.rb
module Api
  module V1
    class ReviewsController < ApplicationController
      before_action :set_review, only: [:show, :update, :destroy]

      def index
        @reviews = Review.all
        render json: @reviews, status: :ok
      end

      def show
        render json: @review, status: :ok
      end

      def create
        @review = Review.new(review_params)
        if @review.save
          render json: { message: 'Review was successfully created.', review: @review }, status: :created
        else
          render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @review.update(review_params)
          render json: { message: 'Review was successfully updated.', review: @review }, status: :ok
        else
          render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @review.destroy
        render json: { message: 'Review was successfully deleted.' }, status: :ok
      end

      private

      def set_review
        @review = Review.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Review not found' }, status: :not_found
      end

      def review_params
        params.require(:review).permit(:user_id, :item_id, :rating, :review_text)
      end
    end
  end
end
