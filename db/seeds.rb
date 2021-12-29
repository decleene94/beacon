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


# location = [ [1.3009304686855414, 103.86190676209692],
#               [1.3001823326763027, 103.85776568935245],
#               [1.29233814536148, 103.8592790120353],
#               [1.2893853867448841, 103.86342200463666],
#               [1.2863651667042184, 103.85917300916131]]

miguel = User.create!(
    email: "miguel@123.com",
    password: "beacon",
    first_name: "Miguel",
    last_name: "Vela",
    latitude: 1.3009304686855414,
    longitude: 103.86190676209692
  )

john = User.create!(
    email: "john@123.com",
    password: "beacon",
    first_name: "John",
    last_name: "Decl",
    latitude: 1.29233814536148,
    longitude: 103.85776568935245
  )

soonteck = User.create!(
    email: "st@123.com",
    password: "beacon",
    first_name: "Soon Teck",
    last_name: "Ling",
    latitude: 1.3001823326763027,
    longitude: 103.8592790120353
  )

ann = User.create!(
    email: "ann@123.com",
    password: "beacon",
    first_name: "Ann",
    last_name: "Koh",
    latitude: 1.2893853867448841,
    longitude: 103.86342200463666
  )

rabea = User.create!(
    email: "rabea@123.com",
    password: "beacon",
    first_name: "Rabea",
    last_name: "Glei",
    latitude: 1.2863651667042184,
    longitude: 103.85917300916131
  )

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

Radar.create!(time:"ASAP", description:"Looking for a cure for my hangover ", radius: "", user_id: john.id, activity_id: brunch.id)
Radar.create!(time:"ASAP", description:"I don't want to be lonely tonight", radius: "", user_id: miguel.id, activity_id: drinks.id)
Radar.create!(time:"ASAP", description:"You gotta fight. For your right. To parrrrrty.", radius: "", user_id: soonteck.id, activity_id: party.id)

puts "seeds created"
