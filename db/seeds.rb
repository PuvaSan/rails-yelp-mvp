# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts 'Cleaning the database...'

Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants....'

Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_name, category: 'chinese', phone_number: Faker::PhoneNumber.phone_number)
Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_name, category: 'japanese', phone_number: Faker::PhoneNumber.phone_number)
Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_name, category: 'french', phone_number: Faker::PhoneNumber.phone_number)
Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_name, category: 'italian', phone_number: Faker::PhoneNumber.phone_number)
Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_name, category: 'belgian', phone_number: Faker::PhoneNumber.phone_number)

puts 'Restaurants created!'

puts 'creating reviews!'

Restaurant.all.each do |restaurant|
  Review.create(content: Faker::Quotes::Shakespeare.as_you_like_it_quote, rating: rand(0..5), restaurant: restaurant)
end

puts 'completed creating reviews and assigning it to a Restaurant instance'
