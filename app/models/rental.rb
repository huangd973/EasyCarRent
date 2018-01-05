class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  # validates :status, inclusion: { in: %w(available booked_drivy booked_mifleet renting offline) },
  #                    presence: true
end
