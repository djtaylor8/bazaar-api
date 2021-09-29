class Api::V1::CommentsController < ApplicationController
    
    def index 
      comments = Comment.all 
      render json: comments 
    end

    def show 
      comment = Comment.find(params[:id])
      render json: comment 
    end

    def create 
      comment = Comment.create(comment_params)
      render json: comment 
    end

    def destroy 
      comment = Comment.find(params[:id])
      if comment.destroy 
        render json: { status: 'success', message: 'Comment was deleted'}
      else
        render json: { error: 'error', message: 'Sorry, there was an error...'}
    end

    private 

    def comment_params
      params.permit(:product_id, :user_id, :content)
    end
end
