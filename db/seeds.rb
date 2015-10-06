# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#when adding a user with devise you must add email, password & password_confirmation

#create two users
user_1 = User.create(first_name: "Laura", last_name: "Kirby", password:"laura@example.com", password_confirmation: "laura@example.com", email:"laura@example.com", image_url: "/images/laura.png", current_race: 0)
user_2 = User.create(first_name: "Olivia", last_name: "The Pig", password:"olivia@example.com", password_confirmation: "olivia@example.com", email: "olivia@example.com", image_url:"https://bit.ly/1LLPIIr", current_race: 1)

#Parse races JSON into Ruby hash
races_file = File.read('data-races.json')
races_hash = JSON.parse(races_file)

#Parse steps JSON into Ruby hash
b2b_plan_file = File.read('data-plan-steps.json')
b2b_step = JSON.parse(b2b_plan_file)

#create two races
b2b = Race.create(name: races_hash["races"][0]["name"], distance: races_hash["races"][0]["distance"], image_url:races_hash["races"][0]["image"], date: races_hash["races"][0]["date"], cost: races_hash["races"][0]["cost"], about:races_hash["races"][0]["about"])
boston = Race.create(name: races_hash["races"][1]["name"], distance: races_hash["races"][1]["distance"], image_url:races_hash["races"][1]["image"], date: races_hash["races"][1]["date"], cost: races_hash["races"][1]["cost"], about:races_hash["races"][1]["about"])

#create a fitness plan
b2b_plan = FitnessPlan.create(plan_title: "Bay To Breakers", plan_summary: "Preparing for a 15k is fun! We have outlined a few steps that will help you prepare for race day")

#create two steps

b2b_day_1 = Step.create(title: b2b_step["two_weeks_before"][1]["focus"], summary: b2b_step["two_weeks_before"][0]["activity"])
b2b_day_2 = Step.create(title: b2b_step["two_weeks_before"][2]["focus"], summary: b2b_step["two_weeks_before"][1]["activity"])
b2b_day_3 = Step.create(title: b2b_step["two_weeks_before"][3]["focus"], summary: b2b_step["two_weeks_before"][2]["activity"])
b2b_day_4 = Step.create(title: b2b_step["two_weeks_before"][4]["focus"], summary: b2b_step["two_weeks_before"][3]["activity"])
b2b_day_5 = Step.create(title: b2b_step["two_weeks_before"][5]["focus"], summary: b2b_step["two_weeks_before"][4]["activity"])
b2b_day_6 = Step.create(title: b2b_step["two_weeks_before"][6]["focus"], summary: b2b_step["two_weeks_before"][5]["activity"])
b2b_day_7 = Step.create(title: b2b_step["two_weeks_before"][7]["focus"], summary: b2b_step["two_weeks_before"][6]["activity"])

b2b_day_8 = Step.create(title: b2b_step["two_weeks_before"][8]["focus"], summary: b2b_step["two_weeks_before"][7]["activity"])
b2b_day_9 = Step.create(title: b2b_step["two_weeks_before"][9]["focus"], summary: b2b_step["two_weeks_before"][8]["activity"])
b2b_day_10 = Step.create(title: b2b_step["two_weeks_before"][10]["focus"], summary: b2b_step["two_weeks_before"][9]["activity"])
b2b_day_11 = Step.create(title: b2b_step["two_weeks_before"][11]["focus"], summary: b2b_step["two_weeks_before"][10]["activity"])
b2b_day_12 = Step.create(title: b2b_step["two_weeks_before"][12]["focus"], summary: b2b_step["two_weeks_before"][11]["activity"])

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