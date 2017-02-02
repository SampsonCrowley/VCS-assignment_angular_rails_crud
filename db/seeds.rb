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
PINS_PER_USER = 3

while(User.count < NUM_USERS)
  begin
    user = User.create(
      username: Faker::Beer.name.split(" ").join("").downcase,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password"
    )
  rescue
  end
end

users = User.all
puts "creating pins"
users.each do |user|
  PINS_PER_USER.times do
    user.pins.create(
      purchase: (rand(10) < 5),
      item_name: Faker::Hipster.words(rand(2)+1).join(" "),
      description: Faker::Hacker.say_something_smart
    )
  end
end
