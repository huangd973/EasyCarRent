class Car < ApplicationRecord
  mount_uploaders :cars, CarUploader
  has_many :rentals, dependent: :destroy
end
