class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    gon.date = Date.today.strftime('%d-%m-%Y')
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
      marker.infowindow "<b>#{car.name}</b>" + "<p> <p>" + "<p>Immatriculation : #{car.plaque}</p>" + "<p>Kilometrage : #{car.odometer} km</p>" + "<p>Carburant OBD : #{car.computerfueltank} L</p>" + "<p>Carburant Tank : #{car.fueltank} L</p>"
      marker.json({
        :plaque => car.plaque,
        :odometer => car.odometer,
        :city => car.city,
        :fueltank => car.fueltank,
        :fuelobd => car.computerfueltank
      })
    end
  end

end
