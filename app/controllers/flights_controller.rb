class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_departure_city
  end
end
