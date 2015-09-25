# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#when adding a user with devise you must add email, password & password_confirmation

#Parse race JSON into Ruby hash
b2b_file = File.read('data-bay-to-breakers.json')
b2b_hash = JSON.parse(b2b_file)

#Parse steps JSON into Ruby hash
b2b_plan_file = File.read('data-plan-steps.json')
b2b_step = JSON.parse(b2b_plan_file)

#create two users
user_1 = User.create(first_name: "Thomas", last_name: "The Train", password:"thomas@example.com", password_confirmation: "thomas@example.com", email:"thomas@example.com", image_url: "https://bit.ly/1MoVWkm")
user_2 = User.create(first_name: "Olivia", last_name: "The Pig", password:"olivia@example.com", password_confirmation: "olivia@example.com", email: "olivia@example.com", image_url:"https://bit.ly/1LLPIIr")

#create two races
b2b = Race.create(name: b2b_hash["name"], distance: b2b_hash["distance"], image_url:b2b_hash["image"], date: b2b_hash["date"], cost: b2b_hash["cost"])
boston = Race.create(name: "Boston Marathon", distance: "26 miles", image_url:"http://bit.ly/1OOXsyT", date: "04/15/2016", cost: 175)

#create a fitness plan
b2b_plan = FitnessPlan.create(plan_title: "Bay To Breakers", plan_summary: "Preparing for a 15k is fun! We have outlined a few steps that will help you prepare for race day")

#create two steps
b2b_day_1 = Step.create(title: b2b_step["two_weeks_before"][0]["day_1"]["focus"], summary: b2b_step["two_weeks_before"][0]["day_1"]["activity_description"])
b2b_day_2 = Step.create(title: b2b_step["two_weeks_before"][1]["day_2"]["focus"], summary: b2b_step["two_weeks_before"][1]["day_2"]["activity_description"])
b2b_day_3 = Step.create(title: b2b_step["two_weeks_before"][2]["day_3"]["focus"], summary: b2b_step["two_weeks_before"][2]["day_3"]["activity_description"])
b2b_day_4 = Step.create(title: b2b_step["two_weeks_before"][3]["day_4"]["focus"], summary: b2b_step["two_weeks_before"][3]["day_4"]["activity_description"])
b2b_day_5 = Step.create(title: b2b_step["two_weeks_before"][4]["day_5"]["focus"], summary: b2b_step["two_weeks_before"][4]["day_5"]["activity_description"])
b2b_day_6 = Step.create(title: b2b_step["two_weeks_before"][5]["day_6"]["focus"], summary: b2b_step["two_weeks_before"][5]["day_6"]["activity_description"])
b2b_day_7 = Step.create(title: b2b_step["two_weeks_before"][6]["day_7"]["focus"], summary: b2b_step["two_weeks_before"][6]["day_7"]["activity_description"])

b2b_day_8 = Step.create(title: b2b_step["one_week_before"][0]["day_8"]["focus"], summary: b2b_step["one_week_before"][0]["day_8"]["activity_description"])
b2b_day_9 = Step.create(title: b2b_step["one_week_before"][1]["day_9"]["focus"], summary: b2b_step["one_week_before"][1]["day_9"]["activity_description"])
b2b_day_10 = Step.create(title: b2b_step["one_week_before"][2]["day_10"]["focus"], summary: b2b_step["one_week_before"][2]["day_10"]["activity_description"])
b2b_day_11 = Step.create(title: b2b_step["one_week_before"][3]["day_11"]["focus"], summary: b2b_step["one_week_before"][3]["day_11"]["activity_description"])
b2b_day_12 = Step.create(title: b2b_step["one_week_before"][4]["day_12"]["focus"], summary: b2b_step["one_week_before"][4]["day_12"]["activity_description"])

#create completed step by adding adding a user id and step id
user_step = CompletedStep.create(user_id: user_1.id, step_id: b2b_day_1.id)
user_step.save!

#add b2b race to user_1's races
user_1.races << b2b
user_1.save!

#add b2b_plan to b2b's fitness_plan
b2b.fitness_plan = b2b_plan
b2b.save!

#add steps to fitness_plan
b2b_plan.steps << [b2b_day_1, b2b_day_2, b2b_day_3, b2b_day_4, b2b_day_5, b2b_day_6, b2b_day_7, b2b_day_8, b2b_day_9, b2b_day_10, b2b_day_11, b2b_day_12]
b2b_plan.save!

#add completed_step to user_1's completed steps


#add boston race to user_2's races
user_2.races << boston
user_2.save!

#CREATE PLAN 
#use ruby's open method to access json file
#then parseJSON
#add create statements for Race/Plan

#how would this play out in the 'real world'?
#you would most likely have a script that would insert data into the JSON file. 
#you don't want to have to insert data manually 