class PhotosController < ApplicationController
	before_action :authenticate_user!
	before_action :set_photo, only: [:show, :destroy]

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
	end

	def destroy
		@photo.destroy
		respond_to do |format|
			format.html { redirect_to photos_path, notice: 'Photo deleted'}
		end
	end

	private
		def photo_params
			params.require(:photo).permit(:title, :image)
		end

		def set_photo
			@photo = Photo.find(params[:id])
		end
end
