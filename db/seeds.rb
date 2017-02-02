# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying data"
User.destroy_all

puts "creating users"
NUM_USERS = 10

NUM_USERS.times do
  User.create(
    username: Faker::Beer.name.join("").downcase,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end

users = User.all
puts "creating pins"
users.each do |user|
  user.pins.create(
    buy: (rand(10) < 5),
    item_name: Faker::Hipster.words(rand(2)+1),
    description: Faker::Hacker.say_something_smart
  )
end
