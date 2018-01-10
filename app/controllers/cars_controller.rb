class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index, :search]

  def index
    @cars = Car.all.order :name
  end

  def show
    AddressFromXeeJob.perform_now(@car.plaque)
    @rentals = @car.rentals.order :starts_on
    gon.hasha = Gmaps4rails.build_markers(@car) do |car, marker|
      marker.lat car.latitude
      marker.lng car.longitude
    end
  end

  def new
    @car = Car.new
  end

  def search
    @result = []
    if params[:starts_on] == ""
      redirect_to cars_path
    else
      starts_on = Date.parse(params[:starts_on])
      ends_on = Date.parse(params[:ends_on])
      @available_car_id = Rental.where.not("starts_on >= ? AND ends_on <= ?", starts_on, ends_on).pluck(:car_id)
      @available_cars = Car.find(@available_car_id)
      @available_cars.each do |car|
        @result << car if car.city == params[:city]
      end
    end
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_rental_path(@car)
    end
  end

  def update
    @car.update(car_params)
    if @car.save
      redirect_to car_path
    end
  end

   def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name,:city , :description, :address, :plaque, :price_cents, :gearbox, :consommation, :engine, :nb_door, :places, :type_car, :price_by_km, :year, {cars: []})
    end
end
