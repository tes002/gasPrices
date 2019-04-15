class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # GET /users/1/nearby
  def nearbydefault

  end

  # PUT /users/1/nearby
  def nearby
    @user = User.find(params[:id])
    @gas_stations = GasStation.all
    if @gas_stations.present?
      if @user.update(user_params)
        latitude = @user.latitude
        longitude = @user.longitude
      else
	render json: {status: 'ERROR', message:'Obtained no geolocation of user', data:gas_station.errors}, status: :unprocessable_entity
	return
      end
      @gas_station = nil
      price = nil
      # initial radius to find gas station: 11km (6.9miles), 
      lat_radius = 0.1
      lng_radius = 0.01
      calculated_set = Set.new()
      while lat_radius < 2 && lng_radius < 0.2 && calculated_set.size() < GasStation.count
	for @station in @gas_stations
	  if (@user.latitude - @station.latitude).abs < lat_radius && (@user.longitude - @station.longitude).abs < lng_radius && !calculated_set.include?(@station)
	    calculated_set.add(@station)
	    if @gas_station == nil || @station.price < price
	      @gas_station = @station
	      price = @gas_station.price
	    end
	  end
	end
	if @gas_station == nil
	  lat_radius += 0.1
	  lng_radius += 0.01
	else 
	  render json: {status: 'SUCCESS', message:'Found cheapest nearby gas station', data:@gas_station},status: :ok
	  return
	end
      end
      render json: {status: 'SUCCESS', message:'No gas station nearby'},status: :ok
      return
    else
      render json: {status: 'SUCCESS', message:'No gas station recorded'},status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :latitude, :longitude)
    end
end
