# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

Cd.destroy_all

10.times do
  cds = Cd.new(
    name: Faker::Movie.title,
    description: Faker::Movie.quote,
    price: Faker::Number.decimal(l_digits: 2),
    user_id: 1
  )
  cds2 = Cd.new(
    name: Faker::Movie.title,
    description: Faker::Movie.quote,
    price: Faker::Number.decimal(l_digits: 2),
    user_id: 2
  )
  cds.save!
  cds2.save!
end
puts "Finished!"
