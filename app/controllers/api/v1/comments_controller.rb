class Api::V1::CommentsController < ApplicationController

	def create
		@comment = Comment.create(comment_params)
		if @comment.valid?
			render json: @comment
		else
			render json: {errors: @comment.errors.full_message }
		end
	end
	def index
		@comments = Comment.all
	end


	private
	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.permit(:content,:owner,:photo_id) 
	end
end
