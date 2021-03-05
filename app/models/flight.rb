class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.order_by_departure_city
    order(:departure_city)
  end

  def adult_passengers
    passengers.where('age >= 18')
  end

  def adult_passengers_avg_age
    adult_passengers.average(:age).to_f
  end
end
