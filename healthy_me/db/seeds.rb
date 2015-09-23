# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#when adding a user with devise you must add email, password & password_confirmation

b2b_file = File.read('data-bay-to-breakers.json')
b2b_hash = JSON.parse(b2b_file)

b2b_plan_file = File.read('data-plan-steps.json')
b2b_plan_hash = JSON.parse(b2b_plan_file)

#create two users
user_1 = User.create(first_name: "Thomas", last_name: "The Train", password:"thomas@example.com", password_confirmation: "thomas@example.com", email:"thomas@example.com", image_url: "http://bit.ly/1MoVWkm")
user_2 = User.create(first_name: "Olivia", last_name: "The Pig", password:"olivia@example.com", password_confirmation: "olivia@example.com", email: "olivia@example.com", image_url:"http://bit.ly/1LLPIIr")

#create two races
b2b = Race.create(name: b2b_hash["name"], distance: b2b_hash["distance"], image_url:b2b_hash["image"], date: b2b_hash["date"], cost: b2b_hash["cost"])
boston = Race.create(name: "Boston Marathon", distance: "26 miles", image_url:"http://bit.ly/1OOXsyT", date: "04/15/2016", cost: 175)

#create a fitness plan
b2b_plan = FitnessPlan.create(plan_title: "Bay To Breakers", plan_summary: "Preparing for a 15k is fun! We have outlined a few steps that will help you prepare for race day")

#create two steps
b2b_day_1 = Step.create(title: b2b_plan_hash["two_weeks_before"][0]["day_1"]["focus"], summary: b2b_plan_hash["two_weeks_before"][0]["day_1"]["activity_description"])
b2b_day_2 = Step.create(title: b2b_plan_hash["two_weeks_before"][1]["day_2"]["focus"], summary: b2b_plan_hash["two_weeks_before"][1]["day_2"]["activity_description"])

#add b2b race to user_1's races
user_1.races << b2b
user_1.save!

#add b2b_plan to b2b's fitness_plan
b2b.fitness_plan = b2b_plan
b2b.save!

#add steps to fitness_plan
b2b_plan.steps << b2b_day_1
b2b_plan.steps << b2b_day_2
b2b_plan.save!

#add boston race to user_2's races
user_2.races << boston
user_2.races << b2b
user_2.save!


#CREATE PLAN 
#use ruby's open method to access json file
#then parseJSON
#add create statements for Race/Plan

#how would this play out in the 'real world'?
#you would most likely have a script that would insert data into the JSON file. 
#you don't want to have to insert data manually 