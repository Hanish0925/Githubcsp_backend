# app/controllers/api/v1/posts_controller.rb
module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user!, only: [:create, :update, :destroy]
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        @posts = Post.all
        render json: @posts, status: :ok
      end

      def show
        render json: @post, status: :ok
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          render json: { message: 'Post was successfully created.', post: @post }, status: :created
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: { message: 'Post was successfully updated.', post: @post }, status: :ok
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
        render json: { message: 'Post was successfully destroyed.' }, status: :ok
      end

      private

      def set_post
        @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Post not found' }, status: :not_found
      end

      def post_params
        params.require(:post).permit(:title, :content)
      end
    end
  end
end
