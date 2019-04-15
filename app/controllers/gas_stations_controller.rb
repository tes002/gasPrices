class GasStationsController < ApplicationController
  before_action :set_gas_station, only: [:show, :update, :destroy]

  # GET /gas_stations
  def index
    @gas_stations = GasStation.all

    render json: @gas_stations
  end

  # GET /gas_stations/1
  def show
    gas_station = GasStation.find(params[:id]) 
    render json: {status: 'SUCCESS', message:'Loaded gas station', data:gas_station},status: :ok
  end

  # POST /gas_stations
  def create
    gas_station = GasStation.new(gas_station_params)

    if gas_station.save
      render json: {status: 'SUCCESS', message:'Created gast station', data:gas_station}, status: :created, location: gas_station
    else
      render json: {status: 'ERROR', message:'Gas station not created', data:gas_station.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gas_stations/1
  def update
    gas_station = GasStation.find(params[:id]) 
    if gas_station.update(gas_station_params)
      render json: {status: 'SUCCESS', message:'Updated gas station information', data:gas_station},status: :ok
    else
      render json: {status: 'ERROR', message:'Gas station information not changed', data:gas_station.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /gas_stations/1
  def destroy
    gas_station = GasStation.find(params[:id]) 
    @gas_station.destroy
    render json: {status: 'SUCCESS', message:'Deleted gas station', data:gas_station},status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_station
      @gas_station = GasStation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gas_station_params
      params.require(:gas_station).permit(:name, :address, :latitude, :longitude, :price)
    end
end
