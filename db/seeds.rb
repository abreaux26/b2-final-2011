# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@flight_1 = Flight.create!(number: '1727', date:  '08/03/20', time: '12:00 pm', departure_city: 'Denver', arrival_city: 'Reno')
@flight_2 = Flight.create!(number: '1562', date:  '08/05/20', time: '08:00 am', departure_city: 'Conway', arrival_city: 'Houston')

@passenger_1 = @flight_1.passengers.create!(name: 'Angel', age: 24)
@passenger_2 = @flight_1.passengers.create!(name: 'Chris', age: 28)
@passenger_3 = @flight_1.passengers.create!(name: 'Easton', age: 8)

@passenger_4 = @flight_2.passengers.create!(name: 'Travis', age: 43)
@passenger_5 = @flight_2.passengers.create!(name: 'Jen', age: 37)
@passenger_6 = @flight_2.passengers.create!(name: 'Eli', age: 7)
