class PlacesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        page = params[:page]
        defined?(page) ? page=page : page = 0 #assigned the parameter to a local variable and we just want to check it has a value, if this is true, then do what is after the question mark. if false do what's after the colon
        @places = Place.order("name").page(params[:page]).per_page(3)
    end

    def new
       # @place = Place.new
    end

    def create
        #Place.create(place_params)
        current_user.places.create(place_params)
        redirect_to root_path
    end
    
    def show
        @place = Place.find(params[:id])
    end

    def edit
        @place = Place.find(params[:id])
    end

    def update
        @place = Place.find(params[:id])
        @place.update_attributes(place_params)
        redirect_to root_path
    end

    def destroy
        @place = Place.find(params[:id])
        @place.destroy
        redirect_to root_path
    end

    private
    
    def place_params
        params.require(:place).permit(:name, :description, :address)
    end
end
