class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @cars = Car.all.order('RANDOM()').limit(6)
  end

  def dashboard
    AddressFromXeeJob.perform_now("all")
    @cars_all = Car.all
    gon.hasha = Gmaps4rails.build_markers(@cars_all) do |car, marker|
      marker.title car.name
      marker.lat car.latitude
      marker.lng car.longitude
    end
  end
end
