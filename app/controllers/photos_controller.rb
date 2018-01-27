class PhotosController < ApplicationController
	before_action :authenticate_user!
	before_action :set_photo, only: [:show, :destroy]
	include PhotosHelper

	def index
		@photos = Photo.where(user_id: current_user.id)
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.user_id = current_user.id

		respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Your photo is now live.' }
      else
        format.html { render :new }
      end
    end
	end

	def show
		@url = download_image @photo
	end

	def update_title
		@photo = Photo.find(params[:photo_id])

		unless @photo.title == params
			if @photo.update(title: params[:photo_title])
				render body: nil #render nothing doesn't work anymore, WHYY??
			else
				redirect_to @photo
			end
		end
	end

	def destroy
		@photo.destroy
		respond_to do |format|
			format.html { redirect_to photos_path, notice: 'Photo deleted'}
		end
	end

	private
		def photo_params
			params.require(:photo).permit(:title, :image, :photo_title)
		end

		def set_photo
			@photo = Photo.find(params[:id])
		end
end
