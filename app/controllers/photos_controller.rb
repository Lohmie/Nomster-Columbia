class PhotosController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @place = Place.find(params[:place_id])
        @place.photos.create(photos_params)
        redirect_to place_path(@place)
    end

    def photos_params
        params.require(:photo).permit(:caption, :picture) #you're only allowing people to submit caption and photo
    end
end