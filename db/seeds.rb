# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying User table"
User.destroy_all
puts "destorying Radar table"
Radar.destroy_all
puts "destroying Participant table"
Participant.destroy_all
puts "destroying Message table"
Message.destroy_all
puts "destroying Activity table"
Activity.destroy_all
puts "****"*20
puts "****"*20
puts "****"*20
puts "Creating Users...."
puts "****"*20

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: '#123abc',
    first_name: Faker::FunnyName.name,
    last_name: Faker::Creature::Animal.name
  )
  puts "Created user #{user.id}, with name #{user.first_name} #{user.last_name}"
end

puts "****"*20
puts "Creating Activities..."
puts "****"*20

10.times do
  activity = Activity.create(
    name: Faker::Hobby.activity
  )
  puts "Created Activity with activity id #{activity.id} and name #{activity.name}"
end

puts "****"*20
puts "Creating Radars..."
puts "****"*20


3.times do
  radar = Radar.create(
    time: "ASAP",
    description: Faker::TvShows::RickAndMorty.quote,
    radius: rand(1..5),
    user_id: User.all.sample.id,
    activity_id: rand(1..5)
  )
  puts "Created Radar with radar id: #{radar.id}, user id: #{radar.user_id}, description: #{radar.description}, radius: #{radar.radius}, activity: #{radar.activity_id}, time: #{radar.time}   "
end

puts "****"*20
puts "Creating Participants..."
puts "****"*20

3.times do
  participant = Participant.create(
    user_id: User.all.sample.id,
    radar_id: Radar.all.sample.id,
    status: false
  )
   puts "Created participant id #{participant.id} | with user id #{participant.user_id} and radar id #{participant.radar_id}"
end
