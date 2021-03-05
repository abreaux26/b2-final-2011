class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_passenger_count_departure_city
  end

  def show
    @flight = Flight.find(params[:id])
    @passengers = @flight.passengers
    @adult_passengers = @passengers.adults
    @adult_passengers_avg_age = @passengers.adults_avg_age
  end
end
