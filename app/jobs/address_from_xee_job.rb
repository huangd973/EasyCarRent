class AddressFromXeeJob < ApplicationJob
  queue_as :default

  def perform(plaque)
    headers = {
      "Authorization"  => "Bearer 423128d467cdd4a515d75497f554136cf6ec25a439259c7cb95717dd6550e50c"
      }
      if plaque == "AB-506-JF"
        u = HTTParty.get(
          "https://cloud.xee.com/v3/cars/31585/status",
          :headers => headers
          )
        car_signal = u["signals"]
        car_localisation = u["location"]
        car_odometer = car_signal.find {|x| x['name'] == 'Odometer' }
        car_fueltank = car_signal.find {|x| x['name'] == 'FuelLevel' }
        car_computerfueltank = car_signal.find {|x| x['name'] == 'ComputedFuelLevel' }
        computerfueltank = car_computerfueltank["value"]
        fueltank = car_fueltank["value"]
        odometer = car_odometer["value"]
        longitude = car_localisation["longitude"]
        latitude = car_localisation["latitude"]
        Car.first.update!(
          odometer: odometer,
          longitude: longitude,
          latitude: latitude,
          fueltank: fueltank,
          computerfueltank: computerfueltank
          )
        puts u
        puts "AB-506-JF Do it"

      elsif plaque == "BJ-838-TG"
         u = HTTParty.get(
          "https://cloud.xee.com/v3/cars/21737/status",
          :headers => headers
          )
         car_localisation = u["location"]
         longitude = car_localisation["longitude"]
         latitude = car_localisation["latitude"]
         Car.last.update!(
          longitude: longitude,
          latitude: latitude
          )
         puts u
         puts "BJ-838-TG Do it"
      else
        puts "ERROR " + plaque + " NOT FOUND !!!!!!!!!!!!!!!!!"
      end
  end
end
