# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

40.times do |n|
  Project.create!(name:  Faker::Company.name,
             person_responsible: Faker::Name.name,
             project_start_date: Faker::Date.backward(50),
             planned_termination_date: Faker::Date.forward(50))
end

100.times do |p|
  Milestone.create!(name: Faker::Company.catch_phrase, 
              description: Faker::Hacker.say_something_smart,
              person_responsible: Faker::Name.name,
              completed: [true, false].sample,
              project_id: Faker::Number.between(1, 40))
end
