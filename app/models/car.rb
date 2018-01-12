class Car < ApplicationRecord
  mount_uploaders :cars, CarUploader
  has_many :rentals, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  def city_with_cars
    "Car #{cars} in #{city} "
  end
end
