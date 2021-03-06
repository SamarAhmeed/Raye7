class PickupsController < ApplicationController
  before_action :set_pickup, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_passenger?

  # GET /pickups
  # GET /pickups.json
  def index
    @pickups = Pickup.all
    @place = Place.all
    @pickup = Pickup.new
    @pickup.user_id=current_user.id
    @pickup.time=Time.now
  end

  # GET /pickups/1
  # GET /pickups/1.json
  def show
  end

  # GET /pickups/new
  def new
    @place = Place.all
    @pickup = Pickup.new
    @pickup.user_id=current_user.id
    @pickup.time=Time.now
  end

  # GET /pickups/1/edit
  def edit
    @place = Place.all
    @pickup.user_id=current_user.id
  end

  # POST /pickups
  # POST /pickups.json
  def create
    @place = Place.all
    @pickup = Pickup.new(pickup_params)
    @pickup.user_id=current_user.id
    respond_to do |format|
      if @pickup.save
        format.html { redirect_to @pickup, notice: 'Pickup was successfully created.' }
        format.json { render :show, status: :created, location: @pickup }
      else
        format.html { render :new }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickups/1
  # PATCH/PUT /pickups/1.json
  def update
    @place = Place.all
    @pickup.user_id=current_user.id
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to @pickup, notice: 'Pickup was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickup }
      else
        format.html { render :edit }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickups/1
  # DELETE /pickups/1.json
  def destroy
    @pickup.destroy
    respond_to do |format|
      format.html { redirect_to pickups_url, notice: 'Pickup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup
      @pickup = Pickup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickup_params
      params.require(:pickup).permit(:user_id, :source_id, :destination_id, :time)
    end
    def is_passenger?
      redirect_to root_path unless current_user.role=='passenger'
    end
end