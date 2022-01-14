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
#     latitude: 1.3009304686855414,
#     longitude: 103.86190676209692
#   )


# miguel_photo = URI.open('https://images.unsplash.com/photo-1515095984775-726a54913d0e')
# miguel.photo.attach(io: miguel_photo, filename: "#{miguel.first_name}.jpeg", content_type:'image/png')

# john = User.create!(
#     email: "john@123.com",
#     password: "beacon",
#     first_name: "John",
#     last_name: "Decl",
#     latitude: 1.3247104384513504,
#     longitude: 103.84875188841018
#   )

# john_photo = URI.open('https://avatars.githubusercontent.com/u/88220739?v=4')
# john.photo.attach(io: john_photo, filename: "#{john.first_name}.jpeg", content_type:'image/png')

ann = User.create!(
    email: "ann@123.com",
    password: "beacon",
    first_name: "Ann",
    last_name: "Koh",
    address: '21 Jln Raja Udang Singapore'
  )

  ann_photo = URI.open('https://avatars.githubusercontent.com/u/55132447?v=4')
  ann.photo.attach(io: ann_photo, filename: "#{ann.first_name}.jpeg", content_type:'image/png')


# soonteck = User.create!(
#     email: "st@123.com",
#     password: "beacon",
#     first_name: "Soon Teck",
#     last_name: "Ling",
#     latitude: 1.3001823326763027,
#     longitude: 103.8592790120353
#   )

# soonteck_photo = URI.open('https://images.unsplash.com/photo-1540569014015-19a7be504e3a')
# soonteck.photo.attach(io: soonteck_photo, filename: "#{soonteck.first_name}.jpeg", content_type: 'image/png')


# pitbull = User.create!(
#     email: "roberto@123.com",
#     password: "beacon",
#     first_name: "Pitbull",
#     last_name: "Drake",
#     latitude: 1.3284933239312138,
#     longitude: 103.84196700710132
#   )

# pitbull_photo= URI.open('https://images.unsplash.com/photo-1529111290557-82f6d5c6cf85')
# pitbull.photo.attach(io: pitbull_photo, filename: "#{pitbull.first_name}.jpeg", content_type: 'image/png')

# venga = User.create!(
#     email: "venga@123.com",
#     password: "beacon",
#     first_name: "Venga",
#     last_name: "Elan",
#     latitude: 1.3285400157474954,
#     longitude:  103.84206041583887
# )
# venga_photo = URI.open('https://avatars.githubusercontent.com/u/86636163?v=4')
# venga.photo.attach(io: venga_photo, filename: "#{venga.first_name}.jpeg", content_type:'image/png')

# rabea = User.create!(
#     email: "rabea@123.com",
#     password: "beacon",
#     first_name: "Rabea",
#     last_name: "Glei",
#     latitude: 1.2863651667042184,
#     longitude: 103.85917300916131
#   )

#   rabea_photo = URI.open('https://avatars.githubusercontent.com/u/8995723?v=4')
#   rabea.photo.attach(io: rabea_photo, filename: "#{rabea.first_name}.jpeg", content_type:'image/png')


puts "****"*20
puts "Creating Activities..."
puts "****"*20

drinks = Activity.create!(name: "Drinks")
coffee = Activity.create!(name: "Coffee")
brunch = Activity.create!(name: "Brunch")
dinner = Activity.create!(name: "Dinner")
party = Activity.create!(name: "Party")

puts "****"*20
puts "Creating Radars..."
puts "****"*20

# Radar.create!(time:"ASAP", description:"Looking for a cure for my hangover ", radius: "", user_id: john.id, activity_id: brunch.id)
# Radar.create!(time:"ASAP", description:"Wine tasting night. I deserve this!", radius: "", user_id: venga.id, activity_id: drinks.id)
# Radar.create!(time:"ASAP", description:"You gotta fight. For your right. To parrrrrty.", radius: "", user_id: soonteck.id, activity_id: party.id)
# Radar.create!(time:"ASAP", description:"It's time to open my piggy bank and treat myself with Two Men Bagels", radius: "", user_id: ann.id, activity_id: brunch.id)
# Radar.create!(time:"ASAP", description:"Farewell dinner with my close friends", radius: "", user_id: rabea.id, activity_id: dinner.id)


puts "seeds created"
