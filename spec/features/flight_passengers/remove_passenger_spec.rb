require 'rails_helper'

RSpec.describe 'When I visit a flights show page' do
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

  describe "When I remove a passenger from a flight" do
    it 'Next to each passengers name I see a button to remove that passenger from that flight' do
      visit flight_path(@flight_1)

      within("#passenger-#{@passenger_1.id}") do
        expect(page).to have_button('Remove Passenger')
      end
    end

    it 'I click on that button and am returned to the flights show page' do
      visit flight_path(@flight_1)

      within("#passenger-#{@passenger_1.id}") do
        click_button('Remove Passenger')
      end

      expect(current_path).to eq(flight_path(@flight_1))
    end

    it 'I no longer see that passenger listed' do
      visit flight_path(@flight_1)

      within("#passenger-#{@passenger_1.id}") do
        click_button('Remove Passenger')
      end

      expect(page).not_to have_content(@passenger_1.name)
    end

    it 'I see average age of adult passengers has been updated' do
      visit flight_path(@flight_1)

      within("#passenger-#{@passenger_1.id}") do
        click_button('Remove Passenger')
      end

      within(".average-age-adult-passengers") do
        expect(page).to have_content(28)
      end
    end
  end
end
