class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def self.adults
    where('age >= 18')
  end

  def self.adults_avg_age
    adults.average(:age).to_f
  end
end
