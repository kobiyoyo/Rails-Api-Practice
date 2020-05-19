class Api::V1::CommentsController < ApplicationController
	
	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.build(comment_params)
		if @comment.save
			render json: @comment,status: :created,location: @comment
		else
			render json: {errors: @comment.errors.full_message }
		end
	end


	private
	def set_comment
		@comment = Comment.find(params[:id])
	end
	def comment_params
		params.require.permit(:content) 
	end
end
