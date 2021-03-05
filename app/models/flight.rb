class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.order_by_passenger_count_departure_city
    joins(:passengers)
    .select('flights.*, count(passengers.id) as passenger_count')
    .group(:id)
    .order('passenger_count desc, departure_city')
  end
end
