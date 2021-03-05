require "rails_helper"

RSpec.describe 'When I visit the Flight index' do
  before :each do
    @flight_1 = Flight.create!(number: '1727', date:  '08/03/20', time: '12:00 pm', departure_city: 'Denver', arrival_city: 'Reno')
    @flight_2 = Flight.create!(number: '1562', date:  '08/05/20', time: '08:00 am', departure_city: 'Conway', arrival_city: 'Houston')

    @passenger_1 = @flight_1.passengers.create!(name: 'Angel', age: 24)
    @passenger_2 = @flight_1.passengers.create!(name: 'Chris', age: 28)

    @passenger_3 = @flight_2.passengers.create!(name: 'Travis', age: 43)
    @passenger_4 = @flight_2.passengers.create!(name: 'Jen', age: 37)
    @passenger_5 = @flight_2.passengers.create!(name: 'Eli', age: 7)
  end

  it 'I see that flights are ordered by the number of passengers on the flight from most passengers to least' do
    visit flights_path
    
    expect(@flight_2.number).to appear_before(@flight_1.number)
  end
end
