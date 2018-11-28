module PlacesHelper
    def place_params
        params.require(:place).permit(:name, :longitude, :latitude)
    end
end
