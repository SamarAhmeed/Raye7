class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_driver?
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @place = Place.all
    @trip = Trip.new
    @trip.user_id=current_user.id
    @trip.time=Time.now
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @place = Place.all
    @trip = Trip.new
    @trip.user_id=current_user.id
    @trip.time=Time.now
  end

  # GET /trips/1/edit
  def edit
    @place = Place.all
    @trip.user_id=current_user.id
  
  end

  # POST /trips
  # POST /trips.json
  def create
    @place = Place.all
    @trip = Trip.new(trip_params)
    @trip.user_id=current_user.id
    
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @place = Place.all
    @trip.user_id=current_user.id
  
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:user_id, :source_id, :destination_id, :time, :numberOfSeats)
    end
    
    def is_driver?
      redirect_to root_path unless current_user.role=='driver'
    end
end
