require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  before :each do
    @flight_1 = Flight.create!(number: '1727', date:  '08/03/20', time: '12:00 pm', departure_city: 'Denver', arrival_city: 'Reno')
    @flight_2 = Flight.create!(number: '1562', date:  '08/05/20', time: '08:00 am', departure_city: 'Conway', arrival_city: 'Houston')
  end

  describe 'class methods' do
    describe '::order_by_passenger_count_departure_city' do
      it 'returns flights in alphabetical order by passenger count and then departure city' do
        expected = [@flight_2, @flight_1]

        expect(Flight.order_by_passenger_count_departure_city).to eq(expected)
      end
    end
  end
end
