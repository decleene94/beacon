# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying Message table"
Message.destroy_all
puts "destroying Participant table"
RadarParticipant.destroy_all
puts "destorying Radar table"
Radar.destroy_all
puts "destroying User table"
# User.destroy_all

puts "destroying Activity table"
Activity.destroy_all


puts "****"*20
puts "****"*20
puts "****"*20
puts "Creating Users...."
puts "****"*20


# location = [ [1.3009304686855414, 103.86190676209692],
#               [1.3001823326763027, 103.85776568935245],
#               [1.29233814536148, 103.8592790120353],
#               [1.2893853867448841, 103.86342200463666],
#               [1.2863651667042184, 103.85917300916131]]

# miguel = User.create!(
#     email: "miguel@123.com",
#     password: "beacon",
#     first_name: "Miguel",
#     last_name: "Vela",
#     phone: '+6591556108',
#     address: '441 Balestier Road Singapore'
#   )

# miguel_photo = URI.open('https://images.unsplash.com/photo-1515095984775-726a54913d0e')
# miguel.photo.attach(io: miguel_photo, filename: "#{miguel.first_name}.jpeg", content_type:'image/png')

# john = User.create!(
#     email: "john@123.com",
#     password: "beacon",
#     first_name: "John",
#     last_name: "Decl",
#     phone: '+6591556108',
#     address: '320 Orchard Road Singapore'
#   )

# john_photo = URI.open('https://avatars.githubusercontent.com/u/88220739?v=4')
# john.photo.attach(io: john_photo, filename: "#{john.first_name}.jpeg", content_type:'image/png')

# ann = User.create!(
#     email: "ann@123.com",
#     password: "beacon",
#     first_name: "Ann",
#     last_name: "Koh",
#     address: '3 Changi Business Park Central 1 Singapore'
#   )

#   ann_photo = URI.open('https://avatars.githubusercontent.com/u/55132447?v=4')
#   ann.photo.attach(io: ann_photo, filename: "#{ann.first_name}.jpeg", content_type:'image/png')

#   rabea = User.create!(
#       email: "rabea@123.com",
#       password: "beacon",
#       first_name: "Rabea",
#       last_name: "Glei",
#       phone: '91556108',
#       address: '281 Ocean Drive Singapore'
#     )

#     rabea_photo = URI.open('https://avatars.githubusercontent.com/u/8995723?v=4')
#     rabea.photo.attach(io: rabea_photo, filename: "#{rabea.first_name}.jpeg", content_type:'image/png')

# soonteck = User.create!(
#     email: "st@123.com",
#     password: "beacon",
#     first_name: "Soon Teck",
#     last_name: "Ling",
#   )

# soonteck_photo = URI.open('https://images.unsplash.com/photo-1540569014015-19a7be504e3a')
# soonteck.photo.attach(io: soonteck_photo, filename: "#{soonteck.first_name}.jpeg", content_type: 'image/png')


puts "****"*20
puts "Creating Activities..."
puts "****"*20
breakfast = Activity.create!(name: "Breakfast")
lunch = Activity.create!(name: "Lunch")
dinner = Activity.create!(name: "Dinner")
drinks = Activity.create!(name: "Drinks")
coffee = Activity.create!(name: "Coffee")
party = Activity.create!(name: "Party")
workout = Activity.create!(name: "Workout")
others = Activity.create!(name: "Others")
puts "****"*20
puts "seeds created"
