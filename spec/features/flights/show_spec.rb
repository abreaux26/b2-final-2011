require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @flight_1 = Flight.create!(number: '1727', date:  '08/03/20', time: '12:00 pm', departure_city: 'Denver', arrival_city: 'Reno')
    @flight_2 = Flight.create!(number: '1562', date:  '08/05/20', time: '08:00 am', departure_city: 'Conway', arrival_city: 'Houston')

    @passenger_1 = @flight_1.passengers.create!(name: 'Angel', age: 24)
    @passenger_2 = @flight_1.passengers.create!(name: 'Chris', age: 28)
    @passenger_3 = @flight_1.passengers.create!(name: 'Easton', age: 8)

    @passenger_4 = @flight_2.passengers.create!(name: 'Travis', age: 43)
    @passenger_5 = @flight_2.passengers.create!(name: 'Jen', age: 37)
    @passenger_6 = @flight_2.passengers.create!(name: 'Eli', age: 7)
  end

  describe "When I visit a flight's show page" do
    it "I see the flight's number, date, time, departure city, and arrival city" do
      visit flight_path(@flight_1)

      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_1.date)
      expect(page).to have_content(@flight_1.time)
      expect(page).to have_content(@flight_1.departure_city)
      expect(page).to have_content(@flight_1.arrival_city)

      expect(page).not_to have_content(@flight_2.number)
      expect(page).not_to have_content(@flight_2.date)
      expect(page).not_to have_content(@flight_2.time)
      expect(page).not_to have_content(@flight_2.departure_city)
      expect(page).not_to have_content(@flight_2.arrival_city)
    end

    it 'I see the names of all adult passengers on the flight' do
      visit flight_path(@flight_1)

      within(".adult-passengers") do
        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_2.name)

        expect(page).not_to have_content(@passenger_3.name)
      end

      expect(page).not_to have_content(@passenger_4.name)
      expect(page).not_to have_content(@passenger_5.name)
      expect(page).not_to have_content(@passenger_6.name)
    end

    it 'I see the average age of all adult passengers on the flight' do
      visit flight_path(@flight_1)

      within(".average-age-adult-passengers") do
        expect(page).to have_content('Average age of adult passengers: 26')
      end
    end
  end
end
