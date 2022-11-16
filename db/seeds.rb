require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Creating 5 restaurants with 2 reviews...'
5.times do
  resto = Restaurant.create(
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    category: %w[chinese italian japanese french belgian].sample
  )
  next if resto.nil?

  2.times do
    resto.reviews.create(
      content: Faker::Lorem.paragraph,
      rating: rand(0..5)
    )
  end
end
puts 'Finished!'
