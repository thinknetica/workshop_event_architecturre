# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = 100.times.map do
  User.create!(name: Faker::Name.name)
end

drivers = 100.times.map do
  Driver.create!(name: Faker::Name.name)
end

drivers_copy = drivers.dup.shuffle
cars = 100.times.map do
  car = Car.new(number: Faker::Vehicle.license_plate, level: Car.levels.keys.sample, state: Car.states.keys.sample)
  car.driver = drivers_copy.pop if car.occupied? || car.free?
  car.save!
end
