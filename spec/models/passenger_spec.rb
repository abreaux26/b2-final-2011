require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many :flight_passengers }
    it { should have_many(:flights).through(:flight_passengers) }
  end

  before :each do
    @passenger_1 = Passenger.create!(name: 'Angel', age: 24)
    @passenger_2 = Passenger.create!(name: 'Chris', age: 28)
    @passenger_3 = Passenger.create!(name: 'Easton', age: 8)
  end

  describe 'class methods' do
    describe '::adults' do
      it 'returns passengers whose age is greater than or equal to 18' do
        expected = [@passenger_1, @passenger_2]

        expect(Passenger.adults).to eq(expected)
      end
    end
    describe '::adults_avg_age' do
      it 'returns adult passengers average age' do
        expect(Passenger.adults_avg_age).to eq(26)
      end
    end
  end
end
