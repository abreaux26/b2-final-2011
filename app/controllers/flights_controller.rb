class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_departure_city
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
