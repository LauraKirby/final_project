# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#when adding a user with devise you must add email, password & password_confirmation
u1 = User.create(first_name: "Thomas", last_name: "The Train", password:"thomas@example.com", password_confirmation: "thomas@example.com", email:"thomas@example.com", image_url: "http://bit.ly/1LLPIIr")

u2 = User.create(first_name: "Olivia", last_name: "The Pig", password:"olivia@example.com", password_confirmation: "olivia@example.com", email: "olivia@example.com", image_url:"http://bit.ly/1LLPIIr")

r1 = Race.create(name: "Bay to Breakers", distance: "7 miles", image_url:"http://bit.ly/1OsU11r", date: "05/15/2016", cost: 59)

r2 = Race.create(name: "Boston Marathon", distance: "26 miles", image_url:"http://bit.ly/1OOXsyT", date: "04/15/2016", cost: 175)

u1.races << r1

#use ruby's open method to access json file
#then parseJSON
#add create statements for Race/Plan

#how would this play out in the 'real world'?
#you would most likely have a script that would insert data into the JSON file. 
#you don't want to have to insert data manually 