require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @flight_1 = Flight.create!(number: '1727', date:  '08/03/20', time: '12:00 pm', departure_city: 'Denver', arrival_city: 'Reno')
    @flight_2 = Flight.create!(number: '1562', date:  '08/05/20', time: '08:00 am', departure_city: 'Conway', arrival_city: 'Houston')
  end

  describe 'When I visit the flights index page' do
    it 'I see each flight in the system including its number, departure city, and arrival city' do
      visit flights_path

      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content(@flight_1.number)
        expect(page).to have_content(@flight_1.departure_city)
        expect(page).to have_content(@flight_1.arrival_city)
      end

      within("#flight-#{@flight_2.id}") do
        expect(page).to have_content(@flight_2.number)
        expect(page).to have_content(@flight_2.departure_city)
        expect(page).to have_content(@flight_2.arrival_city)
      end
    end

    it 'And I see that flights are listed in alphabetical order by departure city (A - Z)' do
      visit flights_path

      expect(@flight_2.departure_city).to appear_before(@flight_1.departure_city)
    end
  end
end
