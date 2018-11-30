class PlacesController < ApplicationController
    include PlacesHelper
    def index
        @places = Place.all
    end
    def show
        @place = Place.find(params[:id])
    end
    def new
        @place = Place.new 
    end
    def create
        @place = Place.new(place_params)
        respond_to do |format|
            if @place.save
              format.html { redirect_to @place, notice: 'Place was successfully created.' }
              format.json { render :show, status: :created, location: @place }
            else
              format.html { render :new }
              format.json { render json: @place.errors, status: :unprocessable_entity }
            end
          end
    end
end
