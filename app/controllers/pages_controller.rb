class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @cars = Car.all.order('RANDOM()').limit(6)
    cars = Car.all
    @counted = Hash.new(0)
    cars.each { |h| @counted[h["city"]] += 1 }
    @counted = @counted.map {|k,v| [k, v.to_s] }
  end

  def dashboard
    @cars_all = Car.all
    gon.hasha = Gmaps4rails.build_markers(@cars_all) do |car, marker|
      marker.title car.name
      marker.lat car.latitude
      marker.lng car.longitude
    end
  end
end
