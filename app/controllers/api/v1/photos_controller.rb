class Api::V1::PhotosController < ApplicationController
	before_action :set_photo,only:[:show,:destroy,:update]
	def index
		@photos = Photo.all
		render json: @photos
	end
	def show
	    render json: @photo
	end
	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			render json: @photo,status: :created,location: @photo
		else
			render json: { errors: @photo.errors.full_messages }
		end
	end
	def update
		if @photo.update(photo_params)
			render json: @photo,status: :updated,location: @photo
		else
			render json: { errors: @photo.errors.full_messages }
		end 
	end
	def destroy
		@photo.destroy
	end

	private

	def set_photo
		@photo = Photo.find(params[:id])
	end

	def photo_params
		params.require.permit(:title,:photo_url_string)
	end
end
