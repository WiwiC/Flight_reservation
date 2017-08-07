# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Airports
airports = [ ['LAX','Los Angeles'],
             ['LHR','London'],
             ['SFO','San Francisco'],
             ['ATL','Atlanta'],
             ['LAS','Las Vegas'],
             ['ORD','Chicago'],
             ['AMS','Amsterdam'],
             ['CDG','Paris'],
             ['NYC','New-York'] 
         	]

# Create airports with name and code
airport_array = []

	airports.each do |airport| 
    airport_array << Airport.create(airport_code: airport[0], airport_name: airport[1])
  end

# 10 departure dates in the future
departure_dates = []
10.times do
  departure_dates << Faker::Date.forward(30)
end

# Create flights for every airport

# Origin airports
airport_array.each do |departure|
  departure_airport_id = departure.id

  # Destination airports
  airport_array.each do |arrival|
    next if departure_airport_id == arrival.id # Skip if airports are the same
    arrival_airport_id = arrival.id

    # Departure dates
    departure_dates.each do |date|

      # Create 7 flights for each day
      7.times do
        Flight.create(departure_airport_id: departure_airport_id,
                      arrival_airport_id: arrival_airport_id,
                      duration: rand(60..600),
                      departure_date: Faker::Time.between(date.beginning_of_day, date.end_of_day))
      end
    end
  end
end